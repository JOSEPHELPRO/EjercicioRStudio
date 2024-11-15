#1111 nombrar librearias
library(ggplot2)
library(reshape2)
library(caret)
library(pROC)
library(randomForest)
library(xgboost)
library(rpart)


#2222 Abrir o cargar  el dataset
data <- read.csv("clientes.csv")

data$gender <- as.factor(data$gender)
data$purchased <- as.factor(data$purchased)

set.seed(123)
trainIndex <- createDataPartition(data$purchased, p = 0.8, list = FALSE)
train_data <- data[trainIndex, ]
test_data <- data[-trainIndex, ]



#33333
# 1. Árbol de Decisión
model_tree <- rpart(purchased ~ age + income + gender + web_visits, data = train_data, method = "class")
pred_tree <- predict(model_tree, test_data, type = "prob")[,2]

roc_tree <- roc(test_data$purchased, pred_tree)
auc_tree <- auc(roc_tree)

conf_tree <- confusionMatrix(as.factor(ifelse(pred_tree > 0.5, 1, 0)), test_data$purchased)
precision_tree <- conf_tree$byClass['Pos Pred Value']
sensitivity_tree <- conf_tree$byClass['Sensitivity']
specificity_tree <- conf_tree$byClass['Specificity']

# 2. Random Forest
model_rf <- randomForest(purchased ~ age + income + gender + web_visits, data = train_data)
pred_rf <- predict(model_rf, test_data, type = "prob")[,2]

roc_rf <- roc(test_data$purchased, pred_rf)
auc_rf <- auc(roc_rf)

conf_rf <- confusionMatrix(as.factor(ifelse(pred_rf > 0.5, 1, 0)), test_data$purchased)
precision_rf <- conf_rf$byClass['Pos Pred Value']
sensitivity_rf <- conf_rf$byClass['Sensitivity']
specificity_rf <- conf_rf$byClass['Specificity']

# 3. XGBoost
train_matrix <- model.matrix(purchased ~ age + income + gender + web_visits, data = train_data)[,-1]
test_matrix <- model.matrix(purchased ~ age + income + gender + web_visits, data = test_data)[,-1]

dtrain <- xgb.DMatrix(train_matrix, label = as.numeric(train_data$purchased) - 1)
dtest <- xgb.DMatrix(test_matrix, label = as.numeric(test_data$purchased) - 1)

model_xgb <- xgboost(data = dtrain, label = as.numeric(train_data$purchased) - 1, nrounds = 100, objective = "binary:logistic")
pred_xgb <- predict(model_xgb, dtest)

roc_xgb <- roc(test_data$purchased, pred_xgb)
auc_xgb <- auc(roc_xgb)

conf_xgb <- confusionMatrix(as.factor(ifelse(pred_xgb > 0.5, 1, 0)), test_data$purchased)
precision_xgb <- conf_xgb$byClass['Pos Pred Value']
sensitivity_xgb <- conf_xgb$byClass['Sensitivity']
specificity_xgb <- conf_xgb$byClass['Specificity']



#444444 Crear un dataframe con las métricas
metrics <- data.frame(
  Modelo = c("Árbol de Decisión", "Árbol de Decisión", "Árbol de Decisión", "Árbol de Decisión", 
             "Random Forest", "Random Forest", "Random Forest", "Random Forest", 
             "XGBoost", "XGBoost", "XGBoost", "XGBoost"),
  Métrica = c("AUC", "Precisión", "Sensibilidad", "Especificidad",
              "AUC", "Precisión", "Sensibilidad", "Especificidad", 
              "AUC", "Precisión", "Sensibilidad", "Especificidad"),
  Valor = c(auc_tree, precision_tree, sensitivity_tree, specificity_tree, 
            auc_rf, precision_rf, sensitivity_rf, specificity_rf, 
            auc_xgb, precision_xgb, sensitivity_xgb, specificity_xgb)
)


#555 Convertir el dataframe a formato largo
metrics_long <- reshape2::melt(metrics, id.vars = c("Modelo", "Métrica"))


#666 Graficar las métricas
ggplot(metrics_long, aes(x = Modelo, y = value, fill = Métrica)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Comparación de Métricas entre Modelos", y = "Valor", x = "Modelo") +
  scale_fill_manual(values = c("red", "green", "blue", "purple")) + 
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme(legend.title = element_blank())  
