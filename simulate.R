
library(dplyr)

# Sample sizes
n_v1 <- 100
n_v2 <- 100

# Simulate V1

# Session and timing
session_duration_v1 <- pmax(rnorm(n_v1, 60, 15), 10)
search_loading_v1 <- pmax(rnorm(n_v1, 10, 3), 3)

# Button clicks
search_clicked_v1 <- rbinom(n_v1, 1, 0.65)
remove_clicked_v1 <- rbinom(n_v1, 1, 0.40)
apply_filters_clicked_v1 <- rbinom(n_v1, 1, 0.50)
reset_data_clicked_v1 <- rbinom(n_v1, 1, 0.30)

# Tab switches
tab_raw_table_v1 <- rbinom(n_v1, 1, 0.80)
tab_raw_trend_v1 <- rbinom(n_v1, 1, 0.75)
tab_filtered_table_v1 <- rbinom(n_v1, 1, 0.60)
tab_filtered_trend_v1 <- rbinom(n_v1, 1, 0.55)

# Scrolling on tabs
scroll_raw_table_v1 <- rbinom(n_v1, 1, 0.70)
scroll_raw_trend_v1 <- rbinom(n_v1, 1, 0.65)
scroll_filtered_table_v1 <- rbinom(n_v1, 1, 0.60)
scroll_filtered_trend_v1 <- rbinom(n_v1, 1, 0.55)

# Interactions
interactions_v1 <- rpois(n_v1, lambda = 5)

# Errors
error_occurred_v1 <- rbinom(n_v1, 1, 0.05)

user_tracking_v1 <- data.frame(
  UserID = paste0("V1_User_", 1:n_v1),
  Version = "V1",
  SessionDuration = session_duration_v1,
  SearchClicked = search_clicked_v1,
  RemoveClicked = remove_clicked_v1,
  ApplyFiltersClicked = apply_filters_clicked_v1,
  ResetDataClicked = reset_data_clicked_v1,
  TabSwitch_RawTable = tab_raw_table_v1,
  TabSwitch_RawTrend = tab_raw_trend_v1,
  TabSwitch_FilteredTable = tab_filtered_table_v1,
  TabSwitch_FilteredTrend = tab_filtered_trend_v1,
  Scrolled_RawTable = scroll_raw_table_v1,
  Scrolled_RawTrend = scroll_raw_trend_v1,
  Scrolled_FilteredTable = scroll_filtered_table_v1,
  Scrolled_FilteredTrend = scroll_filtered_trend_v1,
  SearchLoadingTime = search_loading_v1,
  Interactions = interactions_v1,
  ErrorOccurred = error_occurred_v1
)

# Simulate V2

# Session and timing
session_duration_v2 <- pmax(rnorm(n_v2, 45, 10), 10)
search_loading_v2 <- pmax(rnorm(n_v2, 8, 2), 2)

# Button clicks
search_clicked_v2 <- rbinom(n_v2, 1, 0.80)
remove_clicked_v2 <- rbinom(n_v2, 1, 0.50)
apply_filters_clicked_v2 <- rbinom(n_v2, 1, 0.70)
reset_data_clicked_v2 <- rbinom(n_v2, 1, 0.40)

# Tab switches
tab_search_page_v2 <- rbinom(n_v2, 1, 0.85)
tab_table_display_v2 <- rbinom(n_v2, 1, 0.80)
tab_trends_viz_v2 <- rbinom(n_v2, 1, 0.75)

# Scrolling on tabs
scroll_trends_viz_v2 <- rbinom(n_v2, 1, 0.60)

# Dropdown menu interactions
dropdown_used_v2 <- rbinom(n_v2, 1, 0.60)
dropdown_incorp_status_v2 <- ifelse(dropdown_used_v2 == 1, rbinom(n_v2, 1, 0.5), 0)
dropdown_liquidated_yn_v2 <- ifelse(dropdown_used_v2 == 1, rbinom(n_v2, 1, 0.5), 0)
dropdown_charges_yn_v2 <- ifelse(dropdown_used_v2 == 1, rbinom(n_v2, 1, 0.5), 0)
dropdown_insolvent_yn_v2 <- ifelse(dropdown_used_v2 == 1, rbinom(n_v2, 1, 0.5), 0)
dropdown_vip_list_v2 <- ifelse(dropdown_used_v2 == 1, rbinom(n_v2, 1, 0.5), 0)

# Interactions
interactions_v2 <- rpois(n_v2, lambda = 7)

# Errors
error_occurred_v2 <- rbinom(n_v2, 1, 0.02)

user_tracking_v2 <- data.frame(
  UserID = paste0("V2_User_", 1:n_v2),
  Version = "V2",
  SessionDuration = session_duration_v2,
  SearchClicked = search_clicked_v2,
  RemoveClicked = remove_clicked_v2,
  ApplyFiltersClicked = apply_filters_clicked_v2,
  ResetDataClicked = reset_data_clicked_v2,
  TabSwitch_SearchPage = tab_search_page_v2,
  TabSwitch_TableDisplay = tab_table_display_v2,
  TabSwitch_TrendsVisualization = tab_trends_viz_v2,
  Scrolled_TrendsVisualization = scroll_trends_viz_v2,
  DropdownUsed_TrendsVisualization = dropdown_used_v2,
  Dropdown_IncorporationStatus = dropdown_incorp_status_v2,
  Dropdown_LiquidatedYN = dropdown_liquidated_yn_v2,
  Dropdown_ChargesYN = dropdown_charges_yn_v2,
  Dropdown_InsolventYN = dropdown_insolvent_yn_v2,
  Dropdown_VIPList = dropdown_vip_list_v2,
  SearchLoadingTime = search_loading_v2,
  Interactions = interactions_v2,
  ErrorOccurred = error_occurred_v2
)
