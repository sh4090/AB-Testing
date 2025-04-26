library(dplyr)

# Uploading Simulated Data
V1 = read.csv("C:\\Users\\hassa\\Desktop\\project 3\\user_tracking_v1.csv")
V2 = read.csv("C:\\Users\\hassa\\Desktop\\project 3\\user_tracking_v2.csv")

# Creating Metrics
metrics = full_join(V1, V2)

### 0 for missing values
metrics[is.na(metrics)] = 0

### Primary Metric 1: Session Duration is already included.

### Primary Metric 2: Search Time to Full Session Time ratio
metrics$search_full_ratio = metrics$SearchLoadingTime / metrics$SessionDuration

### Primary Metric 3: Interactions per session duration
metrics$interactions_rate = metrics$Interactions / metrics$SessionDuration

### Primary Metric 3: Interactions per post-search time
metrics$post_interactions_rate = metrics$Interactions / (metrics$SessionDuration - metrics$SearchLoadingTime)

### Primary Metric 4: Error Rate
error_v1 = sum(V1$ErrorOccurred)/nrow(V1)
error_v2 = sum(V2$ErrorOccurred)/nrow(V2)

# Data Visulization
library(ggplot2)
library(tidyr)

# Loading Time
ggplot(metrics, aes(x = SearchLoadingTime, color = Version, fill = Version)) +
  geom_density(alpha = 0.4) +
  labs(title = "Distribution of Loading Time by App Version",
       x = "Loading Time (seconds)",
       y = "Density") +
  theme_minimal()

# Aalysis Time
metrics$analysis_time = metrics$SessionDuration - metrics$SearchLoadingTime

ggplot(metrics, aes(x = analysis_time, color = Version, fill = Version)) +
  geom_density(alpha = 0.4) +
  labs(title = "Distribution of Interaction Time by App Version",
       x = "Interaction Time (seconds)",
       y = "Density") +
  theme_minimal()

# Buttons Used
button_clicks <- metrics %>%
  select(Version, SearchClicked, RemoveClicked, ApplyFiltersClicked) %>%
  pivot_longer(
    cols = c(SearchClicked, RemoveClicked, ApplyFiltersClicked),
    names_to = "Button",
    values_to = "Clicked"
  ) %>%
  group_by(Version, Button) %>%
  summarise(TotalClicks = sum(Clicked), .groups = "drop")

button_clicks$rate = button_clicks$TotalClicks/100

ggplot(button_clicks, aes(x = Button, y = TotalClicks, fill = Version)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Number of Sessions with Button Clicks by Version",
       x = "Button",
       y = "Number of Clicks") +
  theme_minimal()

ggplot(button_clicks, aes(x = Button, y = rate, fill = Version)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Rate of Sessions with Button Clicks by Version",
       x = "Button",
       y = "Number of Sessions with Clicks") +
  theme_minimal()

# Tab Switches (since they are unique to each version, no need to group by version)
tab_switches <- metrics %>%
  select(TabSwitch_RawTable, TabSwitch_RawTrend, TabSwitch_FilteredTable, TabSwitch_FilteredTrend,
         TabSwitch_SearchPage, TabSwitch_TableDisplay, TabSwitch_TrendsVisualization) %>%
  pivot_longer(
    cols = c(TabSwitch_RawTable, TabSwitch_RawTrend, TabSwitch_FilteredTable, TabSwitch_FilteredTrend,
             TabSwitch_SearchPage, TabSwitch_TableDisplay, TabSwitch_TrendsVisualization),
    names_to = "Tab",
    values_to = "Switched"
  ) %>%
  group_by(Tab) %>% 
  summarise(TotalSwitches = sum(Switched), .groups = "drop")

ggplot(tab_switches, aes(x = Tab, y = TotalSwitches)) +
  geom_bar(stat = "identity", position = "dodge", width = 0.4, fill = c(rep( "lightpink", 4), rep("skyblue", 3)), 
           alpha = 0.6) +
  labs(title = "Number of Sessions with Tab Switches (grouped by version)",
       x = "Tab",
       y = "Number of Sessions with Switches") +
  theme_minimal()

# Session Duration (Primary Metric 1)
ggplot(metrics, aes(x = SessionDuration, color = Version, fill = Version)) +
  geom_density(alpha = 0.4) +
  labs(title = "PRIMARY METRIC 1: Distribution of Session Duration by App Version",
       x = "Session Duration (seconds)",
       y = "Density") +
  theme_minimal()

# Primary Metric 2: Search Time to Full Session Time ratio
ggplot(metrics, aes(x = Version, y = search_full_ratio, fill = Version)) +
  geom_boxplot() +
  labs(title = "Search Loading Time / Full Session Time, by Version",
       x = "Version",
       y = "Search/Full Time Ratio") +
  theme_minimal()

### Primary Metric 3: Interactions per session duration
ggplot(metrics, aes(x = Version, y = interactions_rate, fill = Version)) +
  geom_boxplot() +
  labs(title = "Rate of Interactions over entire session duration, by Version",
       x = "Version",
       y = "Interactions per second") +
  theme_minimal()

# Primary Metric 4: Interactions per post-search time
ggplot(metrics, aes(x = Version, y = post_interactions_rate, fill = Version)) +
  geom_boxplot() +
  labs(title = "Rate of Interactions over duration after loading time, by Version",
       x = "Version",
       y = "Interactions per second") +
  theme_minimal()

# Number of Interactions
ggplot(metrics, aes(x = Interactions, color = Version, fill = Version)) +
  geom_density(alpha = 0.4) +
  labs(title = "Distribution of Number of Interaction per Session, by App Version",
       x = "Number of Interactions",
       y = "Density") +
  theme_minimal()

# Summary Statistics

PM = metrics %>% select(Version, SessionDuration, search_full_ratio, interactions_rate, post_interactions_rate)

summary(PM[PM$Version == "V1", 2:5])
summary(PM[PM$Version == "V2", 2:5])

# Statistical Tests, assuming assumptions met for the tests (especially independence and normality over time)

##  PM1: Compare Session Duration (V1 vs V2)
t.test(SessionDuration ~ Version, data = metrics)

## PM2: Compare Search Time to Full Session Time Ratio
t.test(search_full_ratio ~ Version, data = metrics)

## PM3: Compare Interactions per Session Duration
t.test(interactions_rate ~ Version, data = metrics)

## PM4: Compare Interactions per Post-Search Duration
t.test(post_interactions_rate ~ Version, data = metrics)

## PM5: Comparing Error Rate
error_table <- table(metrics$Version, metrics$ErrorOccurred)
chisq.test(error_table)