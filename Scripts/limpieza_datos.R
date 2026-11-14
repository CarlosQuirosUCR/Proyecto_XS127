library(readxl)
# Ruta de datos.
ruta_datos <- "../Datos/datos_gas.xlsx"
# Carga los datos
datos <- read_excel(ruta_datos)
# Crear objeto ts
datos_ts <- ts(datos$`Consumo de Gas Residencial`, start=c(1973,1),frequency=12)
# Cortar los datos
datos_limpios <- window(datos_ts, start=c(2000,1), end=c(2026,6))
# Guardar datos
saveRDS(datos_limpios, file="../Datos/datos_limpios.rds")
