# Trend Analysis of UK Companies (A/B Testing)
Automated Retrieval, Analysis, and A/B Testing of Companies House Data

  -  Version 1:   https://wqkuks-sara-hassani.shinyapps.io/AB-Testing-V1/
  -  Version 2:  https://sara-hassani.shinyapps.io/AB-Testing-V2/

This project builds on my process automation project (also available on my GitHub at https://github.com/sh4090/Process-Automation and on my blog on https://sarahassanicareer.wixsite.com/my-portfolio/post/process-automation-uk-companies-house-api-data-extraction).

## 📦 Project Structure

| `app_v1.R`               | Shiny App Version 1: Original full-tab version                           |
| `app_v2.R`               | Shiny App Version 2: Simplified UI version                               |
| `simulate.R`             | R code to simulate user tracking data for A/B test                       |
| `user_tracking_v1.csv`   | Simulated user interaction data for Version 1                            |
| `user_tracking_v2.csv`   | Simulated user interaction data for Version 2                            |
| `statistical analysis.R` | Data Visulization and Statistical Tests on Primary and Secondary Metrics |
| `report.Rmd`             | RMarkdown source for the final project report                            |

## 🛠️ Application Features

  -  Automated Data Retrieval: Real-time querying of Companies House API, resolving messy company names (Ltd, LLC, Plc, etc.).
  -  Comprehensive Entity Profiles: Extraction of company officers, persons of significant control (PSC), charges, insolvency history, SIC code-based industry categorization.
  -  Custom Filtering Tools: Dynamic side panel to filter by incorporation date, industry, jurisdiction, liquidation status, officers, and more.
  -  Interactive Data Visualization: Pie charts, histograms, and barplots showing company status distributions, officer lists, PSC patterns, and more.
  -  Process Automation: Reduces manual due diligence research time by 90+%.

I create 2 versions of the application which can be found in `app_v1.R` and `app_v2.R`, attempting UI optimization

## 📈 A/B Testing Experiment
Research Question:
_Does the introduction of improved navigation tools (such as a more prominent display of filters and a dedicated Trends dropdown menu) in Version 2 of the application lead to higher user engagement and more efficient task completion compared to Version 1?_

Two versions of the app were tested:
  -  **Version 1 (V1)**:
      - Traditional sidebar filters
      - Multiple scrolling-heavy tabs
      - Visualizations in a stacked format
  -  **Version 2 (V2)**:
      -  Dedicated search page with progress feedback
      -  Dropdown-driven visualization tab
      -  Simplified tab structure

**Primary Evaluation Metrics**
  -  Session Duration
  -  Search Loading Time / Full Session Time Ratio
  -  Interaction Rate per Session Duration
  -  Interaction Rate per Post-Search Time
  -  Error Rate

### Key Findings
#### Takeaways

The A/B testing experiment revealed several notable differences between Version 1 (V1) and Version 2 (V2) of the Trend Analysis of UK Companies application:

  -   **Session Duration**: Users spent significantly more time on V1 sessions compared to V2. However, this was partially due to longer loading times in V1.
  -   **Search Loading Time**: V2 substantially reduced the time users spent waiting for search results.
  -   **Interaction Rates**: Users exhibited a higher rate of interactions per second in V2, but total interaction counts were impacted by additional UI elements (e.g., dropdown options).
  -   **Error Rate**: Although V2 showed a lower error rate than V1, the difference was not statistically significant, aligning with the fact that core search functionalities remained unchanged across versions.

Overall, Version 2 demonstrated improvements in session efficiency and user interaction density without introducing significant increases in error occurrences.

#### Limitations

While the findings from the metrics so far are informative, several limitations must be acknowledged:

  -   **Interaction Rate Comparability**: The higher number of potential interactions introduced in V2 (due to drop-down menus) complicates direct comparison of interaction rates and totals between versions.
  -   **Session Time Bias**: Differences in session duration between V1 and V2 introduce bias in rate-based metrics (e.g., interactions per second).
  -   **Error Rate Analysis**: Without detailed error logging (e.g., exact error type, company input that triggered the error), it is difficult to diagnose and resolve the underlying causes of errors.
  -   **Simulated Data**: Due to constraints in obtaining live user data, this analysis is based on simulated sessions, which, while realistically modeled, may not fully capture true user behavior variability.

Future iterations of the app should include more granular error tracking and clickstream logging to allow deeper validation of engagement and reliability metrics based on real-world usage. I have provided examples of such variables in _Appendix A_, explaining the generation of simulated data.

#### Interim Recommendation and Next Steps

Based on these findings, my recommendation would be to move forward with V2 instead of V1. This is because, while time spent on V2 is less than for V1, which is not ideal, there is more interaction with the website (albeit due to additional UI elements). It ensures continuous engagement of the due diligence and economic intelligence professionals for whom the app is designed. 

This decision would be further strengthened by collecting qualitative feedback from users, such as satisfaction ratings, open-ended comments on usability, and feature-specific evaluations. Incorporating user feedback alongside behavioral tracking would allow for more holistic and user-centered application development in future iterations.
