library(ggplot2)

#' Tema de los gráficos
#'
#' @param titulo_x   Título del eje x.
#' @param titulo_y   Título del eje y.
#' @param usar_linea TRUE agrega geom_line() con estilo definido.
#'                   Usar FALSE con autoplot(), ggseasonplot(), ggsubseriesplot(),
#'                   gg_season(), etc., que no admiten el objeto.
#' @param fuente     Texto de la fuente, alineado a la izquierda al pie.
#' @param color_linea Color de la línea (azul marino por defecto).
#' @param familia    Familia tipográfica.
#' @return Una lista de componentes que se suma al gráfico con `+`.
tema_graficos <- function(
    titulo_x,
    titulo_y,
    usar_linea  = TRUE,
    fuente      = "Fuente: Elaboración propia con datos del U.S. Energy Information Administration, 2026",
    color_linea = "#4682B4",
    familia     = ""
) {
  
  tema <- theme_classic(base_size = 11, base_family = familia) +
    theme(
      # Sin título del gráfico
      plot.title    = element_blank(),
      plot.subtitle = element_blank(),
      
      # Títulos de ejes
      axis.title.x = element_text(size = 12, color = "grey10",
                                  margin = margin(t = 8)),
      axis.title.y = element_text(size = 10, color = "grey10",
                                  margin = margin(r = 8)),
      
      # Texto y marcas de los ejes
      axis.text  = element_text(size = 10, color = "grey20"),
      axis.line  = element_line(color = "grey20", linewidth = 0.4),
      axis.ticks = element_line(color = "grey20", linewidth = 0.4),
      
      # Leyenda discreta
      legend.title    = element_text(size = 10),
      legend.text     = element_text(size = 9),
      legend.position = "bottom",
      legend.key.size = unit(0.4, "cm"),
      
      # Fuente al pie, gris claro, alineada a la izquierda
      plot.caption          = element_text(size = 9, color = "grey60",
                                           hjust = 0, margin = margin(t = 10)),
      plot.caption.position = "plot",
      
      plot.margin      = margin(10, 15, 10, 10),
      plot.background  = element_rect(fill = "white", color = NA),
      panel.background = element_rect(fill = "white", color = NA)
    )
  
  componentes <- list(
    labs(x = titulo_x, y = titulo_y, title = NULL, caption = fuente),
    tema
  )
  
  # Línea solo si la figura lo admite
  if (usar_linea) {
    componentes <- c(
      list(geom_line(color = color_linea, linewidth = 0.6, linetype = "solid")),
      componentes
    )
  }
  
  componentes
}
