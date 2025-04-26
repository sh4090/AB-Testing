# Trend Analysis of UK Companies (A/B Testing)
Automated Retrieval, Analysis, and A/B Testing of Companies House Data

  -  Version 1:   https://wqkuks-sara-hassani.shinyapps.io/AB-Testing-V1/
  -  Version 2:  https://sara-hassani.shinyapps.io/AB-Testing-V2/

This project builds on my process automation project (also available on my GitHub at https://github.com/sh4090/Process-Automation and on my blog on https://sarahassanicareer.wixsite.com/my-portfolio/post/process-automation-uk-companies-house-api-data-extraction).

File/Folder | Description
app_v1.R | Shiny App Version 1: Original full-tab version
app_v2.R | Shiny App Version 2: Improved UI/UX version
simulate.R | R code to simulate user tracking data for A/B test
user_tracking_v1.csv | Simulated user interaction data for Version 1
user_tracking_v2.csv | Simulated user interaction data for Version 2
statistical analysis.R | Statistical comparison between V1 and V2
report.Rmd | RMarkdown source for the final project report
report.pdf | Rendered PDF report including full analysis and visuals
README.md | Project overview (you are reading it!)

## 🛠️ Application Features

  -  Automated Data Retrieval: Real-time querying of Companies House API, resolving messy company names (Ltd, LLC, Plc, etc.).
  -  Comprehensive Entity Profiles: Extraction of company officers, persons of significant control (PSC), charges, insolvency history, SIC code-based industry categorization.
  -  Custom Filtering Tools: Dynamic side panel to filter by incorporation date, industry, jurisdiction, liquidation status, officers, and more.
  -  Interactive Data Visualization: Pie charts, histograms, and barplots showing company status distributions, officer lists, PSC patterns, and more.
  -  Process Automation: Reduces manual due diligence research time by 90+%.

I create 2 versions of the application which can be found in app_v1.R and app_v2.R, attempting UI optimization
