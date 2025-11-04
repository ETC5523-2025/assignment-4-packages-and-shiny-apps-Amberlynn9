library(shiny)
library(ggplot2)
library(dplyr)
library(bslib)
library(etc5523nhu)

data("hai_burden")

ui <- fluidPage(
  theme = bs_theme(bootswatch = "flatly"),

  # --- HEADER ---
  titlePanel(
    div(
      style = "text-align:center; padding:25px; margin-bottom:10px;",
      h2("Exploring the Burden of Healthcare-Associated Infections",
         style = "font-weight:bold; color:#0B5345; margin-bottom:6px;"),
      h4("Germany vs EU/EEA – Based on Zacher et al. (2019)",
         style = "font-weight:normal; color:#117864; margin-top:0;"),
      hr(style = 'width:65%; border-top:1.5px solid #17A589; margin-top:20px; margin-left:auto; margin-right:auto;')
    )
  ),

  # --- LAYOUT ---
  sidebarLayout(

    # --- SIDEBAR ---
    sidebarPanel(
      style = "background-color:#F8F9F9;
               border-radius:10px;
               padding:20px;
               box-shadow:0px 2px 5px rgba(0,0,0,0.1);",

      h4("Select options"),
      helpText("Choose a measure and infection type to explore the estimated burden per 100,000 population."),
      selectInput("measure", "Measure:",
                  choices = unique(hai_burden$measure),
                  selected = unique(hai_burden$measure)[1]),
      selectInput("infection", "Infection type:",
                  choices = unique(hai_burden$infection),
                  selected = unique(hai_burden$infection)[1]),
      br(),
      downloadButton("downloadData", "Download filtered data", class = "btn-success"),
      br(), br(),
      tags$hr(),
      h5("Data source"),
      p("Zacher et al. (2019), EuroSurveillance 24(46): 1900135.",
        style = "font-size:12px; color:#777;"),
      p("European Centre for Disease Prevention and Control (ECDC) Point Prevalence Survey 2011–2012.",
        style = "font-size:12px; color:#777;")
    ),

    # --- MAIN PANEL ---
    mainPanel(
      style = "background-color:white;
               border-radius:10px;
               padding:20px;
               box-shadow:0px 2px 6px rgba(0,0,0,0.1);",

      tabsetPanel(

        # --- RESULTS TAB ---
        tabPanel("📊 Results",
                 plotOutput("plot", height = "420px"),
                 hr(),
                 h4("How to interpret this"),
                 p("Each bar represents the estimated infection burden per 100,000 population for the chosen measure and infection type.
                    The height of the bar shows the estimated value, while the thin lines (error bars) show the uncertainty range."),
                 p("Higher bars indicate greater public-health impact.
                    Comparing across samples reveals how Germany’s burden differs from the EU/EEA average.
                    For example, a taller bar for German PPS means a higher estimated infection burden."),
                 p("DALYs per 100k combine both illness and early death, giving the most complete picture of total health loss."),
                 hr(),
                 h4("Summary insight"),
                 p("Germany consistently shows a higher burden for several infection types, particularly hospital-acquired pneumonia (HAP) and surgical site infections (SSI).
                    DALYs demonstrate that these infections contribute substantially to the overall national health burden.")
        ),

        # --- UNDERSTANDING TAB ---
        tabPanel("📘 Understanding the data",
                 h4("Explanation of measures"),
                 tags$ul(
                   tags$li(strong("HAIs per 100k:"), " Number of healthcare-associated infections per 100,000 people."),
                   tags$li(strong("Deaths per 100k:"), " Number of deaths attributed to HAIs per 100,000 people."),
                   tags$li(strong("DALYs per 100k:"), " Disability-Adjusted Life Years per 100,000 people, combining premature death and time lived in poor health.")
                 ),
                 hr(),
                 h4("Infection types"),
                 tags$ul(
                   tags$li(strong("HAP – Hospital-Acquired Pneumonia:"), " Pneumonia contracted in hospital, often linked to ventilator use."),
                   tags$li(strong("UTI – Urinary Tract Infection:"), " Usually catheter-associated infections occurring in hospital settings."),
                   tags$li(strong("BSI – Bloodstream Infection:"), " Serious infections that enter the bloodstream, often related to invasive devices."),
                   tags$li(strong("SSI – Surgical Site Infection:"), " Infections that occur after surgery at or near the incision site."),
                   tags$li(strong("CDI – Clostridioides difficile Infection:"), " Bacterial gut infection that can follow antibiotic use, leading to severe diarrhoea."),
                   tags$li(strong("All:"), " Combined estimate across all infection types.")
                 ),
                 hr(),
                 h4("Data sources"),
                 tags$ul(
                   tags$li(strong("German_PPS:"), " Representative sample from the German Point Prevalence Survey."),
                   tags$li(strong("German_convenience:"), " Data from selected German hospitals, not nationally weighted."),
                   tags$li(strong("EU_EEA:"), " Aggregated data from EU/EEA member states for regional comparison.")
                 ),
                 hr(),
                 h4("Purpose of this tool"),
                 p("This app translates the results of Zacher et al. (2019) into an accessible format, helping users visualise how healthcare-associated infections differ across regions and infection types.")
        )
      )
    )
  ),

  # --- FOOTER ---
  br(),
  hr(),
  div(
    style = "text-align:center; color:#7F8C8D; font-size:13px; padding:10px;",
    p("Created by Nhu Nguyen | ETC5523 – Communicating with Data | Assignment 4"),
    p("Based on Zacher et al. (2019): EuroSurveillance 24(46): 1900135")
  )
)

# --- SERVER ---
server <- function(input, output) {
  filtered_data <- reactive({
    hai_burden %>%
      filter(measure == input$measure,
             infection == input$infection)
  })

  output$plot <- renderPlot({
    ggplot(filtered_data(), aes(x = sample, y = estimate, fill = sample)) +
      geom_col(width = 0.7, show.legend = FALSE) +
      geom_errorbar(aes(ymin = ci_low, ymax = ci_high), width = 0.2) +
      scale_fill_manual(values = c("#2471A3", "#52BE80", "#E74C3C")) +
      labs(y = "Estimate per 100,000 population",
           x = "Data source",
           title = paste(input$infection, "-", input$measure)) +
      theme_minimal(base_size = 14) +
      theme(
        plot.title = element_text(face = "bold", color = "#1F618D", size = 18, hjust = 0.5),
        axis.title = element_text(face = "bold"),
        axis.text = element_text(color = "#333"),
        panel.grid.minor = element_blank(),
        panel.grid.major.y = element_line(color = "gray85")
      )
  })

  output$downloadData <- downloadHandler(
    filename = function() {
      paste0("hai_burden_", gsub(" ", "_", input$measure), "_", input$infection, ".csv")
    },
    content = function(file) {
      write.csv(filtered_data(), file, row.names = FALSE)
    }
  )
}

# --- RUN APP ---
shinyApp(ui, server)
