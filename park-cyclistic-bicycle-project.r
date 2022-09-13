{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "c8c7dda5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-13T11:29:26.657819Z",
     "iopub.status.busy": "2022-09-13T11:29:26.655683Z",
     "iopub.status.idle": "2022-09-13T11:29:58.666931Z",
     "shell.execute_reply": "2022-09-13T11:29:58.664534Z"
    },
    "papermill": {
     "duration": 32.023677,
     "end_time": "2022-09-13T11:29:58.669940",
     "exception": false,
     "start_time": "2022-09-13T11:29:26.646263",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "also installing the dependency ‘reprex’\n",
      "\n",
      "\n",
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.2 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.6     \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.7     \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.9\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.0     \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.2     \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.1\n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\n",
      "Attaching package: ‘lubridate’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    date, intersect, setdiff, union\n",
      "\n",
      "\n",
      "\n",
      "Attaching package: ‘scales’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:purrr’:\n",
      "\n",
      "    discard\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:readr’:\n",
      "\n",
      "    col_factor\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "install.packages(\"tidyverse\")\n",
    "\n",
    "library(tidyverse) \n",
    "library(lubridate) \n",
    "library(ggplot2) \n",
    "library(scales)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "582f51f8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-13T11:29:58.733271Z",
     "iopub.status.busy": "2022-09-13T11:29:58.687937Z",
     "iopub.status.idle": "2022-09-13T11:29:58.748027Z",
     "shell.execute_reply": "2022-09-13T11:29:58.746138Z"
    },
    "papermill": {
     "duration": 0.072754,
     "end_time": "2022-09-13T11:29:58.750775",
     "exception": false,
     "start_time": "2022-09-13T11:29:58.678021",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#Set a working directory\n",
    "setwd(\"../input/cyclistic-bicycle-dataset\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e6e62552",
   "metadata": {
    "papermill": {
     "duration": 0.007129,
     "end_time": "2022-09-13T11:29:58.764827",
     "exception": false,
     "start_time": "2022-09-13T11:29:58.757698",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# <span style=\"color:#007BA7\"> The Business Task </span>\n",
    "\n",
    "As a data analyst, I will analyze the Cyclistic (a bike-share app in Chicago) data. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, I want to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, I will design a new marketing strategy to convert casual riders into annual members.\n",
    "\n",
    "### How do annual members and casual riders use Cyclistic bikes differently?"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d529a087",
   "metadata": {
    "papermill": {
     "duration": 0.006957,
     "end_time": "2022-09-13T11:29:58.778559",
     "exception": false,
     "start_time": "2022-09-13T11:29:58.771602",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# <span style=\"color:#007BA7\"> Prepare and Process Data (1) </span>\n",
    "\n",
    "* The most recent annual trip data from Cyclistic is provided as attached.\n",
    "* This data includes de-identified User IDs, user type, bike type, and start & end details (times, positions, station names & IDs)\n",
    "* Given the large sizes of the datasets, I will be using R via RStudio to prepare, process, and analyze."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "e840f33b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-13T11:29:58.795504Z",
     "iopub.status.busy": "2022-09-13T11:29:58.793967Z",
     "iopub.status.idle": "2022-09-13T11:31:55.768352Z",
     "shell.execute_reply": "2022-09-13T11:31:55.766281Z"
    },
    "papermill": {
     "duration": 116.986849,
     "end_time": "2022-09-13T11:31:55.772102",
     "exception": false,
     "start_time": "2022-09-13T11:29:58.785253",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Import dataset\n",
    "m8_2021 <- read.csv(\"202108-divvy-tripdata.csv\")\n",
    "m9_2021 <- read.csv(\"202109-divvy-tripdata.csv\")\n",
    "m10_2021 <- read.csv(\"202110-divvy-tripdata.csv\")\n",
    "m11_2021 <- read.csv(\"202111-divvy-tripdata.csv\")\n",
    "m12_2021 <- read.csv(\"202112-divvy-tripdata.csv\")\n",
    "m1_2022 <- read.csv(\"202201-divvy-tripdata.csv\")\n",
    "m2_2022 <- read.csv(\"202202-divvy-tripdata.csv\")\n",
    "m3_2022 <- read.csv(\"202203-divvy-tripdata.csv\")\n",
    "m4_2022 <- read.csv(\"202204-divvy-tripdata.csv\")\n",
    "m5_2022 <- read.csv(\"202205-divvy-tripdata.csv\")\n",
    "m6_2022 <- read.csv(\"202206-divvy-tripdata.csv\")\n",
    "m7_2022 <- read.csv(\"202207-divvy-tripdata.csv\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "5e4bb3b9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-13T11:31:55.793800Z",
     "iopub.status.busy": "2022-09-13T11:31:55.792029Z",
     "iopub.status.idle": "2022-09-13T11:32:05.409105Z",
     "shell.execute_reply": "2022-09-13T11:32:05.407232Z"
    },
    "papermill": {
     "duration": 9.630353,
     "end_time": "2022-09-13T11:32:05.412031",
     "exception": false,
     "start_time": "2022-09-13T11:31:55.781678",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Combine into one single dataframe\n",
    "all_trips <- bind_rows(m8_2021,m9_2021,m10_2021,m11_2021,m12_2021,m1_2022,m2_2022,m3_2022,m4_2022,m5_2022,m6_2022,m7_2022)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "83e49de5",
   "metadata": {
    "_kg_hide-input": true,
    "_kg_hide-output": true,
    "execution": {
     "iopub.execute_input": "2022-09-13T11:32:05.429614Z",
     "iopub.status.busy": "2022-09-13T11:32:05.427978Z",
     "iopub.status.idle": "2022-09-13T11:32:14.393075Z",
     "shell.execute_reply": "2022-09-13T11:32:14.391224Z"
    },
    "papermill": {
     "duration": 8.977002,
     "end_time": "2022-09-13T11:32:14.395933",
     "exception": false,
     "start_time": "2022-09-13T11:32:05.418931",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "   ride_id          rideable_type       started_at          ended_at        \n",
       " Length:5901463     Length:5901463     Length:5901463     Length:5901463    \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       " start_station_name start_station_id   end_station_name   end_station_id    \n",
       " Length:5901463     Length:5901463     Length:5901463     Length:5901463    \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "   start_lat       start_lng         end_lat         end_lng      \n",
       " Min.   :41.64   Min.   :-87.84   Min.   :41.39   Min.   :-88.97  \n",
       " 1st Qu.:41.88   1st Qu.:-87.66   1st Qu.:41.88   1st Qu.:-87.66  \n",
       " Median :41.90   Median :-87.64   Median :41.90   Median :-87.64  \n",
       " Mean   :41.90   Mean   :-87.65   Mean   :41.90   Mean   :-87.65  \n",
       " 3rd Qu.:41.93   3rd Qu.:-87.63   3rd Qu.:41.93   3rd Qu.:-87.63  \n",
       " Max.   :45.64   Max.   :-73.80   Max.   :42.37   Max.   :-87.50  \n",
       "                                  NA's   :5590    NA's   :5590    \n",
       " member_casual     \n",
       " Length:5901463    \n",
       " Class :character  \n",
       " Mode  :character  \n",
       "                   \n",
       "                   \n",
       "                   \n",
       "                   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Inspect the new table that has been created\n",
    "summary(all_trips)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "f5517858",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-13T11:32:14.414354Z",
     "iopub.status.busy": "2022-09-13T11:32:14.412708Z",
     "iopub.status.idle": "2022-09-13T11:32:14.443729Z",
     "shell.execute_reply": "2022-09-13T11:32:14.442017Z"
    },
    "papermill": {
     "duration": 0.042734,
     "end_time": "2022-09-13T11:32:14.446299",
     "exception": false,
     "start_time": "2022-09-13T11:32:14.403565",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 13</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>99103BB87CC6C1BB</td><td>electric_bike</td><td>2021-08-10 17:15:49</td><td>2021-08-10 17:22:44</td><td></td><td></td><td></td><td></td><td>41.77</td><td>-87.68</td><td>41.77</td><td>-87.68</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>EAFCCCFB0A3FC5A1</td><td>electric_bike</td><td>2021-08-10 17:23:14</td><td>2021-08-10 17:39:24</td><td></td><td></td><td></td><td></td><td>41.77</td><td>-87.68</td><td>41.77</td><td>-87.63</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>9EF4F46C57AD234D</td><td>electric_bike</td><td>2021-08-21 02:34:23</td><td>2021-08-21 02:50:36</td><td></td><td></td><td></td><td></td><td>41.95</td><td>-87.65</td><td>41.97</td><td>-87.66</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>5834D3208BFAF1DA</td><td>electric_bike</td><td>2021-08-21 06:52:55</td><td>2021-08-21 07:08:13</td><td></td><td></td><td></td><td></td><td>41.97</td><td>-87.67</td><td>41.95</td><td>-87.65</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>CD825CB87ED1D096</td><td>electric_bike</td><td>2021-08-19 11:55:29</td><td>2021-08-19 12:04:11</td><td></td><td></td><td></td><td></td><td>41.79</td><td>-87.60</td><td>41.77</td><td>-87.62</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>612F12C94A964F3E</td><td>electric_bike</td><td>2021-08-19 12:41:12</td><td>2021-08-19 12:47:47</td><td></td><td></td><td></td><td></td><td>41.81</td><td>-87.61</td><td>41.80</td><td>-87.60</td><td>member</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 13\n",
       "\\begin{tabular}{r|lllllllllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual\\\\\n",
       "  & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & 99103BB87CC6C1BB & electric\\_bike & 2021-08-10 17:15:49 & 2021-08-10 17:22:44 &  &  &  &  & 41.77 & -87.68 & 41.77 & -87.68 & member\\\\\n",
       "\t2 & EAFCCCFB0A3FC5A1 & electric\\_bike & 2021-08-10 17:23:14 & 2021-08-10 17:39:24 &  &  &  &  & 41.77 & -87.68 & 41.77 & -87.63 & member\\\\\n",
       "\t3 & 9EF4F46C57AD234D & electric\\_bike & 2021-08-21 02:34:23 & 2021-08-21 02:50:36 &  &  &  &  & 41.95 & -87.65 & 41.97 & -87.66 & member\\\\\n",
       "\t4 & 5834D3208BFAF1DA & electric\\_bike & 2021-08-21 06:52:55 & 2021-08-21 07:08:13 &  &  &  &  & 41.97 & -87.67 & 41.95 & -87.65 & member\\\\\n",
       "\t5 & CD825CB87ED1D096 & electric\\_bike & 2021-08-19 11:55:29 & 2021-08-19 12:04:11 &  &  &  &  & 41.79 & -87.60 & 41.77 & -87.62 & member\\\\\n",
       "\t6 & 612F12C94A964F3E & electric\\_bike & 2021-08-19 12:41:12 & 2021-08-19 12:47:47 &  &  &  &  & 41.81 & -87.61 & 41.80 & -87.60 & member\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 13\n",
       "\n",
       "| <!--/--> | ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;chr&gt; | ended_at &lt;chr&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 99103BB87CC6C1BB | electric_bike | 2021-08-10 17:15:49 | 2021-08-10 17:22:44 | <!----> | <!----> | <!----> | <!----> | 41.77 | -87.68 | 41.77 | -87.68 | member |\n",
       "| 2 | EAFCCCFB0A3FC5A1 | electric_bike | 2021-08-10 17:23:14 | 2021-08-10 17:39:24 | <!----> | <!----> | <!----> | <!----> | 41.77 | -87.68 | 41.77 | -87.63 | member |\n",
       "| 3 | 9EF4F46C57AD234D | electric_bike | 2021-08-21 02:34:23 | 2021-08-21 02:50:36 | <!----> | <!----> | <!----> | <!----> | 41.95 | -87.65 | 41.97 | -87.66 | member |\n",
       "| 4 | 5834D3208BFAF1DA | electric_bike | 2021-08-21 06:52:55 | 2021-08-21 07:08:13 | <!----> | <!----> | <!----> | <!----> | 41.97 | -87.67 | 41.95 | -87.65 | member |\n",
       "| 5 | CD825CB87ED1D096 | electric_bike | 2021-08-19 11:55:29 | 2021-08-19 12:04:11 | <!----> | <!----> | <!----> | <!----> | 41.79 | -87.60 | 41.77 | -87.62 | member |\n",
       "| 6 | 612F12C94A964F3E | electric_bike | 2021-08-19 12:41:12 | 2021-08-19 12:47:47 | <!----> | <!----> | <!----> | <!----> | 41.81 | -87.61 | 41.80 | -87.60 | member |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 99103BB87CC6C1BB electric_bike 2021-08-10 17:15:49 2021-08-10 17:22:44\n",
       "2 EAFCCCFB0A3FC5A1 electric_bike 2021-08-10 17:23:14 2021-08-10 17:39:24\n",
       "3 9EF4F46C57AD234D electric_bike 2021-08-21 02:34:23 2021-08-21 02:50:36\n",
       "4 5834D3208BFAF1DA electric_bike 2021-08-21 06:52:55 2021-08-21 07:08:13\n",
       "5 CD825CB87ED1D096 electric_bike 2021-08-19 11:55:29 2021-08-19 12:04:11\n",
       "6 612F12C94A964F3E electric_bike 2021-08-19 12:41:12 2021-08-19 12:47:47\n",
       "  start_station_name start_station_id end_station_name end_station_id start_lat\n",
       "1                                                                     41.77    \n",
       "2                                                                     41.77    \n",
       "3                                                                     41.95    \n",
       "4                                                                     41.97    \n",
       "5                                                                     41.79    \n",
       "6                                                                     41.81    \n",
       "  start_lng end_lat end_lng member_casual\n",
       "1 -87.68    41.77   -87.68  member       \n",
       "2 -87.68    41.77   -87.63  member       \n",
       "3 -87.65    41.97   -87.66  member       \n",
       "4 -87.67    41.95   -87.65  member       \n",
       "5 -87.60    41.77   -87.62  member       \n",
       "6 -87.61    41.80   -87.60  member       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(all_trips)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8e14e002",
   "metadata": {
    "papermill": {
     "duration": 0.008529,
     "end_time": "2022-09-13T11:32:14.462473",
     "exception": false,
     "start_time": "2022-09-13T11:32:14.453944",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "I will first focus on the dataset that contains the following:\n",
    "*ride_id*,\n",
    "*rideable_type*,\n",
    "*started_at*,\n",
    "*ended_at*,\n",
    "*member_casual*"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "f98598b0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-13T11:32:14.486051Z",
     "iopub.status.busy": "2022-09-13T11:32:14.484447Z",
     "iopub.status.idle": "2022-09-13T11:32:14.540565Z",
     "shell.execute_reply": "2022-09-13T11:32:14.538498Z"
    },
    "papermill": {
     "duration": 0.073299,
     "end_time": "2022-09-13T11:32:14.543184",
     "exception": false,
     "start_time": "2022-09-13T11:32:14.469885",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "all_trips_v2<- all_trips %>% \n",
    "  select(c(ride_id,rideable_type,started_at,ended_at,member_casual))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "eb723e71",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-13T11:32:14.561834Z",
     "iopub.status.busy": "2022-09-13T11:32:14.560198Z",
     "iopub.status.idle": "2022-09-13T11:32:14.836749Z",
     "shell.execute_reply": "2022-09-13T11:32:14.834894Z"
    },
    "papermill": {
     "duration": 0.288777,
     "end_time": "2022-09-13T11:32:14.839480",
     "exception": false,
     "start_time": "2022-09-13T11:32:14.550703",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".dl-inline {width: auto; margin:0; padding: 0}\n",
       ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
       ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
       ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
       "</style><dl class=dl-inline><dt>ride_id</dt><dd>0</dd><dt>rideable_type</dt><dd>0</dd><dt>started_at</dt><dd>0</dd><dt>ended_at</dt><dd>0</dd><dt>member_casual</dt><dd>0</dd></dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[ride\\textbackslash{}\\_id] 0\n",
       "\\item[rideable\\textbackslash{}\\_type] 0\n",
       "\\item[started\\textbackslash{}\\_at] 0\n",
       "\\item[ended\\textbackslash{}\\_at] 0\n",
       "\\item[member\\textbackslash{}\\_casual] 0\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "ride_id\n",
       ":   0rideable_type\n",
       ":   0started_at\n",
       ":   0ended_at\n",
       ":   0member_casual\n",
       ":   0\n",
       "\n"
      ],
      "text/plain": [
       "      ride_id rideable_type    started_at      ended_at member_casual \n",
       "            0             0             0             0             0 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#check if there is any null values\n",
    "colSums(is.na(all_trips_v2))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "82a1ae7e",
   "metadata": {
    "papermill": {
     "duration": 0.008162,
     "end_time": "2022-09-13T11:32:14.855534",
     "exception": false,
     "start_time": "2022-09-13T11:32:14.847372",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# <span style=\"color:#007BA7\"> Prepare and Process Data (2) </span>\n",
    "**Further Clean Up and Add Data to Prepare for Analysis**\n",
    "\n",
    "* Add columns that list the date, month, day, day of the week, and year of each ride\n",
    "* Add a column that calculates each ride length (*ride_length*)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "21dc47e6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-13T11:32:14.875533Z",
     "iopub.status.busy": "2022-09-13T11:32:14.873641Z",
     "iopub.status.idle": "2022-09-13T11:32:38.819610Z",
     "shell.execute_reply": "2022-09-13T11:32:38.817353Z"
    },
    "papermill": {
     "duration": 23.95901,
     "end_time": "2022-09-13T11:32:38.822932",
     "exception": false,
     "start_time": "2022-09-13T11:32:14.863922",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Add columns that list the year, month, date, day for each ride\n",
    "all_trips_v2$date <- as.Date(all_trips_v2$started_at)\n",
    "all_trips_v2$month <- format(as.Date(all_trips_v2$date), \"%m\")\n",
    "all_trips_v2$day <- format(as.Date(all_trips_v2$date), \"%d\")\n",
    "all_trips_v2$year <- format(as.Date(all_trips_v2$date), \"%Y\")\n",
    "all_trips_v2$day_of_week <- format(as.Date(all_trips_v2$date), \"%A\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "2ad05d97",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-13T11:32:38.842125Z",
     "iopub.status.busy": "2022-09-13T11:32:38.840562Z",
     "iopub.status.idle": "2022-09-13T11:33:14.283267Z",
     "shell.execute_reply": "2022-09-13T11:33:14.280915Z"
    },
    "papermill": {
     "duration": 35.454897,
     "end_time": "2022-09-13T11:33:14.285942",
     "exception": false,
     "start_time": "2022-09-13T11:32:38.831045",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#Add a new column that calculates each ride length in mins\n",
    "all_trips_v2$ride_length <- difftime(all_trips_v2$ended_at, all_trips_v2$started_at)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ac83b1f9",
   "metadata": {
    "papermill": {
     "duration": 0.007832,
     "end_time": "2022-09-13T11:33:14.301400",
     "exception": false,
     "start_time": "2022-09-13T11:33:14.293568",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The *docked_bike* rideable_type designates bikes that were taken out of circulation by Cyclistic to assess for quality control. There are also various trips where ride_length returns a negative duration. These entries need to be omitted from our dataframe. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "baa8e2ba",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-13T11:33:14.319919Z",
     "iopub.status.busy": "2022-09-13T11:33:14.318344Z",
     "iopub.status.idle": "2022-09-13T11:33:22.788793Z",
     "shell.execute_reply": "2022-09-13T11:33:22.786988Z"
    },
    "papermill": {
     "duration": 8.48221,
     "end_time": "2022-09-13T11:33:22.791268",
     "exception": false,
     "start_time": "2022-09-13T11:33:14.309058",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Drop (1)'docked_bike' type and (2)ride_length<0 \n",
    "all_trips_v2 <- all_trips_v2[!(all_trips_v2$rideable_type == \"docked_bike\" | all_trips_v2$ride_length<=0),]"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ed626aad",
   "metadata": {
    "papermill": {
     "duration": 0.007639,
     "end_time": "2022-09-13T11:33:22.806446",
     "exception": false,
     "start_time": "2022-09-13T11:33:22.798807",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# <span style=\"color:#007BA7\"> Analysis & Visualization </span>"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "8fc17fc4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-13T11:33:22.824447Z",
     "iopub.status.busy": "2022-09-13T11:33:22.822875Z",
     "iopub.status.idle": "2022-09-13T11:33:23.183679Z",
     "shell.execute_reply": "2022-09-13T11:33:23.182003Z"
    },
    "papermill": {
     "duration": 0.372323,
     "end_time": "2022-09-13T11:33:23.186118",
     "exception": false,
     "start_time": "2022-09-13T11:33:22.813795",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. \n",
       "      1     362     638    1025    1135   93596 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Perform Descriptive Analysis on ride_length\n",
    "summary(as.numeric(all_trips_v2$ride_length))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "00ca7929",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-13T11:33:23.204854Z",
     "iopub.status.busy": "2022-09-13T11:33:23.203383Z",
     "iopub.status.idle": "2022-09-13T11:33:45.095411Z",
     "shell.execute_reply": "2022-09-13T11:33:45.093416Z"
    },
    "papermill": {
     "duration": 21.904659,
     "end_time": "2022-09-13T11:33:45.098682",
     "exception": false,
     "start_time": "2022-09-13T11:33:23.194023",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips_v2$member_casual</th><th scope=col>all_trips_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>1390.5664 secs</td></tr>\n",
       "\t<tr><td>member</td><td> 776.0127 secs</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " all\\_trips\\_v2\\$member\\_casual & all\\_trips\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t casual & 1390.5664 secs\\\\\n",
       "\t member &  776.0127 secs\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| all_trips_v2$member_casual &lt;chr&gt; | all_trips_v2$ride_length &lt;drtn&gt; |\n",
       "|---|---|\n",
       "| casual | 1390.5664 secs |\n",
       "| member |  776.0127 secs |\n",
       "\n"
      ],
      "text/plain": [
       "  all_trips_v2$member_casual all_trips_v2$ride_length\n",
       "1 casual                     1390.5664 secs          \n",
       "2 member                      776.0127 secs          "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips_v2$member_casual</th><th scope=col>all_trips_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>814 secs</td></tr>\n",
       "\t<tr><td>member</td><td>541 secs</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " all\\_trips\\_v2\\$member\\_casual & all\\_trips\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t casual & 814 secs\\\\\n",
       "\t member & 541 secs\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| all_trips_v2$member_casual &lt;chr&gt; | all_trips_v2$ride_length &lt;drtn&gt; |\n",
       "|---|---|\n",
       "| casual | 814 secs |\n",
       "| member | 541 secs |\n",
       "\n"
      ],
      "text/plain": [
       "  all_trips_v2$member_casual all_trips_v2$ride_length\n",
       "1 casual                     814 secs                \n",
       "2 member                     541 secs                "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips_v2$member_casual</th><th scope=col>all_trips_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>93596 secs</td></tr>\n",
       "\t<tr><td>member</td><td>93594 secs</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " all\\_trips\\_v2\\$member\\_casual & all\\_trips\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t casual & 93596 secs\\\\\n",
       "\t member & 93594 secs\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| all_trips_v2$member_casual &lt;chr&gt; | all_trips_v2$ride_length &lt;drtn&gt; |\n",
       "|---|---|\n",
       "| casual | 93596 secs |\n",
       "| member | 93594 secs |\n",
       "\n"
      ],
      "text/plain": [
       "  all_trips_v2$member_casual all_trips_v2$ride_length\n",
       "1 casual                     93596 secs              \n",
       "2 member                     93594 secs              "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips_v2$member_casual</th><th scope=col>all_trips_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>1 secs</td></tr>\n",
       "\t<tr><td>member</td><td>1 secs</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " all\\_trips\\_v2\\$member\\_casual & all\\_trips\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t casual & 1 secs\\\\\n",
       "\t member & 1 secs\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| all_trips_v2$member_casual &lt;chr&gt; | all_trips_v2$ride_length &lt;drtn&gt; |\n",
       "|---|---|\n",
       "| casual | 1 secs |\n",
       "| member | 1 secs |\n",
       "\n"
      ],
      "text/plain": [
       "  all_trips_v2$member_casual all_trips_v2$ride_length\n",
       "1 casual                     1 secs                  \n",
       "2 member                     1 secs                  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Compare subscribers (mmbers) VS customers (casual)\n",
    "aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = mean)\n",
    "aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = median)\n",
    "aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = max)\n",
    "aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = min)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a3207798",
   "metadata": {
    "papermill": {
     "duration": 0.008932,
     "end_time": "2022-09-13T11:33:45.118552",
     "exception": false,
     "start_time": "2022-09-13T11:33:45.109620",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Do subscribers ride more often, or members ride more often?**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "a5be5918",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-13T11:33:45.139269Z",
     "iopub.status.busy": "2022-09-13T11:33:45.137475Z",
     "iopub.status.idle": "2022-09-13T11:33:45.383910Z",
     "shell.execute_reply": "2022-09-13T11:33:45.381932Z"
    },
    "papermill": {
     "duration": 0.259555,
     "end_time": "2022-09-13T11:33:45.386422",
     "exception": false,
     "start_time": "2022-09-13T11:33:45.126867",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>number_of_rides</th><th scope=col>average_duration</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>2295172</td><td>1390.5664 secs</td></tr>\n",
       "\t<tr><td>member</td><td>3378938</td><td> 776.0127 secs</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & number\\_of\\_rides & average\\_duration\\\\\n",
       " <chr> & <int> & <drtn>\\\\\n",
       "\\hline\n",
       "\t casual & 2295172 & 1390.5664 secs\\\\\n",
       "\t member & 3378938 &  776.0127 secs\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | number_of_rides &lt;int&gt; | average_duration &lt;drtn&gt; |\n",
       "|---|---|---|\n",
       "| casual | 2295172 | 1390.5664 secs |\n",
       "| member | 3378938 |  776.0127 secs |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual number_of_rides average_duration\n",
       "1 casual        2295172         1390.5664 secs  \n",
       "2 member        3378938          776.0127 secs  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "all_trips_v2 %>% \n",
    "     group_by(member_casual) %>% \n",
    "     summarise(number_of_rides = n()\n",
    "               ,average_duration = mean(ride_length))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "969f47ca",
   "metadata": {
    "papermill": {
     "duration": 0.008677,
     "end_time": "2022-09-13T11:33:45.403843",
     "exception": false,
     "start_time": "2022-09-13T11:33:45.395166",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Do subscribers and members differ in choosing which bike to ride?**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "0d00a6c1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-13T11:33:45.424803Z",
     "iopub.status.busy": "2022-09-13T11:33:45.423040Z",
     "iopub.status.idle": "2022-09-13T11:33:45.778275Z",
     "shell.execute_reply": "2022-09-13T11:33:45.775793Z"
    },
    "papermill": {
     "duration": 0.369445,
     "end_time": "2022-09-13T11:33:45.781628",
     "exception": false,
     "start_time": "2022-09-13T11:33:45.412183",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 4 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>rideable_type</th><th scope=col>number_of_rides</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>classic_bike </td><td>1132794</td></tr>\n",
       "\t<tr><td>casual</td><td>electric_bike</td><td>1162378</td></tr>\n",
       "\t<tr><td>member</td><td>classic_bike </td><td>1922623</td></tr>\n",
       "\t<tr><td>member</td><td>electric_bike</td><td>1456315</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 4 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & rideable\\_type & number\\_of\\_rides\\\\\n",
       " <chr> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t casual & classic\\_bike  & 1132794\\\\\n",
       "\t casual & electric\\_bike & 1162378\\\\\n",
       "\t member & classic\\_bike  & 1922623\\\\\n",
       "\t member & electric\\_bike & 1456315\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 4 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | rideable_type &lt;chr&gt; | number_of_rides &lt;int&gt; |\n",
       "|---|---|---|\n",
       "| casual | classic_bike  | 1132794 |\n",
       "| casual | electric_bike | 1162378 |\n",
       "| member | classic_bike  | 1922623 |\n",
       "| member | electric_bike | 1456315 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual rideable_type number_of_rides\n",
       "1 casual        classic_bike  1132794        \n",
       "2 casual        electric_bike 1162378        \n",
       "3 member        classic_bike  1922623        \n",
       "4 member        electric_bike 1456315        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "all_trips_v2 %>% \n",
    "     group_by(member_casual, rideable_type) %>% \n",
    "     summarise(number_of_rides = n())"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "977a3e4c",
   "metadata": {
    "papermill": {
     "duration": 0.009865,
     "end_time": "2022-09-13T11:33:45.800693",
     "exception": false,
     "start_time": "2022-09-13T11:33:45.790828",
     "status": "completed"
    },
    "tags": []
   },
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "f9ef4334",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-13T11:33:45.822187Z",
     "iopub.status.busy": "2022-09-13T11:33:45.820252Z",
     "iopub.status.idle": "2022-09-13T11:33:45.836570Z",
     "shell.execute_reply": "2022-09-13T11:33:45.834478Z"
    },
    "papermill": {
     "duration": 0.030087,
     "end_time": "2022-09-13T11:33:45.839516",
     "exception": false,
     "start_time": "2022-09-13T11:33:45.809429",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#set working directory to output for ggplot\n",
    "setwd('/kaggle/working')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "e63b1051",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-13T11:33:45.863558Z",
     "iopub.status.busy": "2022-09-13T11:33:45.861554Z",
     "iopub.status.idle": "2022-09-13T11:33:47.963681Z",
     "shell.execute_reply": "2022-09-13T11:33:47.961696Z"
    },
    "papermill": {
     "duration": 2.117805,
     "end_time": "2022-09-13T11:33:47.966987",
     "exception": false,
     "start_time": "2022-09-13T11:33:45.849182",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdd2AT5R/H8e9ldu+WvVpG2UuRDTJkiIooAsoQnD9woAKioLLFwVSGiooTVBQc\niMgQQYZsUfaSvUtL98r9/kgJadqmaZu24Xy//kqeu3vue5dr88mTu4uiqqoAAADg5qcr7QIA\nAADgHgQ7AAAAjSDYAQAAaATBDgAAQCMIdgAAABpBsAMAANAIgh0AAIBGEOwAAAA0gmCXPzUz\nftncCb3vaF6pbJi30RQYEtG4dZfR0z+/nG5x74r2vHGroigdv//X+nTHS40URen2+9lCd1j0\nHuJPTVZy0OnNIRFVO/Z6Yumuy05W93GtUEVRvryUVOi1uyIz5eSHrz/fuWWD8OAAo8EUEFq+\nafu7X3nn67jMbHfePvxJW0VR2n5yuFiLKYq6vqZcdrXO4B8U3rhN90kLfrU/2lx8ZWdEBSuK\n8vPVlGKt3IFqSazpY1IURac3bU9IL8lVe464g1t+/+NQUXqwvsQ1+q0v0FIO/0MA/AcR7PKR\neGZtl+oV7h322pJVf15KkjIVyijJMbs3/vrGCwMia96x6UqJvmU6p1oSN27c+Of2U27vWaf3\nrW6nSoXQxCsn1y59//5bq47/9YzbV+e6hJPLm1eOfvTlGWv+PGgMKt/0lkYVAy271v806Zk+\nVWrfs+1aWinWVjhlqkXZ7+pqVSrok6/u/mPFK491qf/gvNKuziVX/h59ODldRFRL+qjv/i2t\nMg78PH9gj1YVy4Sajd7hFWrdPWjUun8Tcs527eiap/rdUSkiyOQbXKtZ14mfbihKbzZvdOva\no8877tmSYlAqO6eg+xBAIanIW3rSgVZBXiJSpf2Qn/88nNWambRnzaJ764eISGDk4BSL21b3\n19RbRKTDsuPWp5d3/LBw4cJV55NcXDwtYaeIBFR+xdZS0B5yunZykoh4h9zp0J569eikPrVE\nxOTXJCHTkuvqPqoZIiJfXEws9NrzYUntXd5PRKLvf+Ufu228cnDDE23KiUhog5G2xkML24hI\nm4WHiquYIqvjY8x1d1ky4r6e2NP61zr5SKy10cVXdnpkkIgsj0kulorz8E2niiJSvnukiARW\nfakkV23z62tdrXssrEaD1i0ah/sZRURvLj93+yX72S5unRNu1ItIcLU6tzauY9YpInLbM4sK\n15tN7KEP9YriV/6pomzC9tENRaR6398LtJTD/5BclcrOKeg+BFBoBDtnFnStJCIVu45PznSc\nlJFysl2gWUQG/nbGXatz5Z+yEzmDXdHlFexUVc1Mv1TJbBCRt07F57pscQe72GNjRMQruJMt\nWd6oLfVsQz+TiLx56pq15eYNdlbDyvuJSP3ntxaoz5IPdpnpVyqY9Yqi++n0Tm+doij6DXGp\nJbZ2q5j9byiKojMEvL70r6yq0s7PeqqliJgDW19Jz/pjtqRf6RDsJSKD5/xuPYBiD/98i79J\nRMbvuFTQ3lRVTbt28e8/f3vv9Rdq+hpFxDODXansHNf3IYCiI9jlKfnKD0ZF0ZvK7UpIy3WG\nna82FpGIJgvdtcabK9ipqvpwGV8RGX08NtepxR3sji/rICKh0Z/lOvWHVuVFpOv6rNhdvMHO\nknIhrahvTs6D3bo+USJSqdOvBeqz5IPduU2DRCSg8vOqqr4RHSIird/bX2Jrt1p+RyURaTDy\nj+zNmQ+X9RWRwdsvWp+fXtVbRMIavmE/08kVD4pIaN1pBe1NVdW51YPtvwzxzGBXKjvH9X0I\noOg4xy5Phz+cmK6qFTrOaeRrzHWGeqM+XLZs2YeTaovIv0u7K4pS9e7lDvPsn9tKUZToIeuy\nnqsZqxaM69q8doi/l29QRKPbe01fsj2vAnaPb+pwgnzMP8uf6de1erlQs9EUGFqxTY/Bi/88\nb520uHaYya+JiFw7OVFRlNBaH+faQ4EKcE7NiFkbl6rozPeH+eRVsIND37zopdeZ/Rv8cDze\n1njijy8f7tm+QkSw2SeoRv1bh46ffyQpw5UCTME+IpJwdt7ZtFyuYrlzzZGEhISlLcs5tMcf\nXfXovW3LhAYYvXyr1m/18tyVjtuVGffltBEdm9UJDfQ1mLzDK9Xs9tAzKw/E2c9z4L1WiqI8\ndTQ24cTPfdvU8TP5fHbxxjUihd4iJyypFhHxi/KzPs25qy3pFz945Ylba1byM5vDykf2emzM\n37G5n2LoSnlOjjSrrc/VVxTFv9xjDguuHPGriDQZ/4SI9J50q4j8Nek9h3k2/6+Ooij37b9i\n36hmximK4hveO/u8mSvmvNS2XjV/s1dEpdoPv7gg2SJ1fU0512tv+T9XRaTv0w2yN+seuaOC\niOzbcNH6fP1L60Wk1cz+9jNV7DQnyKCL2T/2/PWDysXeRKTNuDfffffdd999d8bUQU7KK5yC\n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\nQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Visualize the number of monthly bike riders\n",
    "all_trips_v2 %>% \n",
    "  group_by(member_casual, month) %>% \n",
    "  summarize(number_of_rides = n()) %>% \n",
    "  arrange(member_casual, month)  %>% \n",
    "  ggplot(aes(x = month, y = number_of_rides, fill = member_casual)) +\n",
    "  geom_col(position = \"dodge\")+labs(subtitle=\"Casual Riders and Monthly Riders for each Month\", \n",
    "                                    y=\"Number of rides\", \n",
    "                                    x=\"Month\", \n",
    "                                    fill = \"User Type\",\n",
    "                                    title=\"Cyclistic Bike-Share Rides:Aug 2021-Jul 2022\") +\n",
    "  scale_y_continuous(name=\"Number of Rides\", label=comma) +\n",
    "  scale_fill_hue(c=45, l=80)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "a225e0c8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-13T11:33:47.991752Z",
     "iopub.status.busy": "2022-09-13T11:33:47.989983Z",
     "iopub.status.idle": "2022-09-13T11:34:04.249726Z",
     "shell.execute_reply": "2022-09-13T11:34:04.247709Z"
    },
    "papermill": {
     "duration": 16.27501,
     "end_time": "2022-09-13T11:34:04.252839",
     "exception": false,
     "start_time": "2022-09-13T11:33:47.977829",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Visualize the daily number of riders by rider type\n",
    "all_trips_v2 %>% \n",
    "  mutate(weekday = wday(started_at, label = TRUE)) %>% \n",
    "  group_by(member_casual, weekday) %>% \n",
    "  summarise(number_of_rides = n()\n",
    "            ,average_duration = mean(ride_length)) %>% \n",
    "  arrange(member_casual, weekday)  %>% \n",
    "  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual))+\n",
    "  geom_col(position = \"dodge\")+labs(subtitle=\"total number of bike rides by weekday and user type\",\n",
    "                                    fill=\"User Type\",\n",
    "                                    y=\"Number of Rides\", \n",
    "                                    x=\"Day of the Week\", \n",
    "                                    title=\"Cyclistic Bike-Share Rides:Aug 2021-Jul 2022\") +\n",
    "  scale_y_continuous(name=\"Number of Rides\", label=comma) +\n",
    "  scale_fill_hue(c=45, l=80)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "505c1f35",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-13T11:34:04.278520Z",
     "iopub.status.busy": "2022-09-13T11:34:04.276711Z",
     "iopub.status.idle": "2022-09-13T11:34:04.910660Z",
     "shell.execute_reply": "2022-09-13T11:34:04.908653Z"
    },
    "papermill": {
     "duration": 0.650907,
     "end_time": "2022-09-13T11:34:04.914267",
     "exception": false,
     "start_time": "2022-09-13T11:34:04.263360",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Don't know how to automatically pick scale for object of type difftime. Defaulting to continuous.\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "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\n2kJ1bwAAAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Visualize the daily average duration(in secs) by rider type\n",
    "all_trips_v2 %>% \n",
    "  group_by(member_casual, day_of_week) %>% \n",
    "  summarise(average_duration = mean(ride_length), .groups = 'drop') %>% \n",
    "  #arrange(member_casual, day_of_week) %>% \n",
    "  ggplot(aes(x = day_of_week, y = average_duration, fill = member_casual)) +\n",
    "  geom_col(position = \"dodge\") +\n",
    "  labs(subtitle=\"average bike duration(in seconds)by weekday and user type\",\n",
    "       x = \"Day of the Week\", y = \"Average Ride Duration (sec)\", \n",
    "       fill = \"User Type\",\n",
    "       title = \"Average Cyclistic Bike-Share Ride Duration:Aug 2021-Jul 2022\")+\n",
    "  scale_fill_hue(c=45, l=80)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a7e2a045",
   "metadata": {
    "papermill": {
     "duration": 0.013333,
     "end_time": "2022-09-13T11:34:04.939364",
     "exception": false,
     "start_time": "2022-09-13T11:34:04.926031",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# <span style=\"color:#007BA7\"> Key Findings </span>\n",
    "\n",
    "* **Users with an annual membership ride more than casual riders**\n",
    "* **Casual riders tend to ride more often during the weekends - Fridays, Saturdays, and Sundays**\n",
    "* **Casual riders spend approximately 76% more time on their rides than users with an annual membership**\n",
    "* **Almost 70% of the casual riders choose electric bikes, compared to about 52% for the riders with an annual membership**"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c946690e",
   "metadata": {
    "papermill": {
     "duration": 0.012204,
     "end_time": "2022-09-13T11:34:04.963826",
     "exception": false,
     "start_time": "2022-09-13T11:34:04.951622",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# <span style=\"color:#007BA7\"> Business Insights </span>\n",
    "\n",
    "* **Implement a new annual membership offered at a lower price point**\n",
    "* **Implement a limited time promotion on the weekends (friday,saturday, and sunday) because those are the most popular among the casual riders**\n",
    "* **Add more electric bikes to inventory since casual riders seem to prefer them!**"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "21a55ee4",
   "metadata": {
    "papermill": {
     "duration": 0.012789,
     "end_time": "2022-09-13T11:34:04.987766",
     "exception": false,
     "start_time": "2022-09-13T11:34:04.974977",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Thank you!"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3783c1b4",
   "metadata": {
    "papermill": {
     "duration": 0.011369,
     "end_time": "2022-09-13T11:34:05.010765",
     "exception": false,
     "start_time": "2022-09-13T11:34:04.999396",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "\n"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 282.642414,
   "end_time": "2022-09-13T11:34:05.447519",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-09-13T11:29:22.805105",
   "version": "2.3.4"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
