# Final project: Education funding, subsidies, and academic performance gap between migrant and local students in China
** Author: Jiayi Zou **
** Date: 02/26/2025 **

## Repo purpose 
This repo is for the *final project* of the course "From Data to Manuscript in R" instructed by Dr. Natalie Dowling.
The basic structure of this repo includes a .qmd which is the manuscript for the final assignment, several R scripts for data cleaning and wrangling, and data analysis, html and pdf files rendered from the qmd file with apaquarto settings, and a csv file containing clean data for research purpose.

## Research question
Internal migration in China has accelerated along with urbanization since the implementation of Reform and Opening Up policy in the early 1980s. Education and sociology research focusing on internal migrant students found that these children have a relatively lower school achievement compared to local students without migrant status, and suffer from academic and financial difficulties, as well as alienation in public education system. 
China's *Hukou* system, a population management system that restraints non-local residents from enjoying the same social public services as local household do, has a history of producing biased human capital investments in education system and limiting internal migrants’ policy supports including ubsidies, fees, and access to local school admission, which contributes migrant students’ underperformance in school.
My research question is: How do differentiated provision of education fundings and subsidies lead to the academic disparities between migrant and local students within schools?

## Data use
The project will use the *follow-up (wave 2)* data collected in 2014-2015 academic year from **China Education Panel Survey (CEPS)** dataset.
[CEPS](http://ceps.ruc.edu.cn/English/Home.htm) is a large-scale, nationally representative, longitudinal survey starting with the 7th and 9th graders in the 2013-2014 academic year, aiming at explaining the linkages between individuals' educational outcomes and multiple contexts of families, school processes, communities and social structure.
In this project, we use wave 2 data because it excludes the individuals without valid follow-up information after the wave 1 survey, which is important for our research as migrant students are more likely to move and change schools, losing connection with the survey group during the process.
Although the dataset is open to public, we save the raw data in the `.gitignore` file to avoid uploading large csvs to github. 
The fully-wrangled data directly related to our research question is stored as `edu_w2.csv` in this folder.

## Research method

## Result

## Repo structure
<!-- TREEVIEW START -->
├───.Rproj.user
│   ├───23B0409B
│   │   ├───bibliography-index
│   │   ├───ctx
│   │   ├───explorer-cache
│   │   ├───pcs
│   │   ├───presentation
│   │   ├───profiles-cache
│   │   ├───sources
│   │   │   ├───per
│   │   │   │   ├───t
│   │   │   │   └───u
│   │   │   ├───prop
│   │   │   └───session-f600810f
│   │   ├───tutorial
│   │   ├───viewer-cache
│   │   └───viewer_history
│   └───shared
│       └───notebooks
├───cepsw1data
│   └───questionnaire
└───cepsw2data
    └───questionnaire
<!-- TREEVIEW END -->

## Project timeline
1. 02/11/2025 clean data 
