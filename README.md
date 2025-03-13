# Final project: Education Funding Inequality and Academic Performance Disparity between Migrant and Local Students in China
Author: Jiayi Zou 
Date: 03/12/2025 

## Repo purpose 
This repo is for the *final project* of the course D2MR instructed by Dr. Natalie Dowling.
The basic structure of this repo includes a .qmd which is the manuscript for the final assignment, an R scripts for function and palette setting, and a pdf file rendered from the qmd file with apaquarto format, and a csv file containing clean data for research purpose.

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
We use Multilevel Modeling (MLM) to analyze the relationship between education funding inequality and academic performance disparity between migrant and local students in China.

## Result

Our findings challenge the conventional assumption that migrant status inherently disadvantages students academically. In the Chinese exam, migrant students demonstrate a significant performance advantage over their local counterparts within the same school. However, across all three subjects (Chinese, Math, and English), educational funding allocation plays a crucial role in shaping academic outcomes.
Specifically, higher per-student funding is consistently associated with improved exam scores, while discrepancies in fiscal allocation, particularly when migrant students receive lower quotas or when key financial information is missing, contribute to their academic disadvantage. The exclusion of migrant students from certain schools further exacerbates disparities, leading to significant negative impacts on their performance. 
Additionally, a higher proportion of educational funding from the prefecture level is found to negatively affect math achievement, suggesting potential inefficiencies in decentralized funding structures.


## Repo structure
<!-- TREEVIEW START -->
├───.Rproj.user
│   ├───23B0409B
│   │   ├───bibliography-index
│   │   ├───ctx
│   │   ├───explorer-cache
│   │   ├───jobs
│   │   ├───pcs
│   │   ├───presentation
│   │   ├───profiles-cache
│   │   ├───quarto-crossref
│   │   ├───sources
│   │   │   ├───per
│   │   │   │   ├───t
│   │   │   │   └───u
│   │   │   ├───prop
│   │   │   └───session-3e0cda0f
│   │   ├───tutorial
│   │   ├───viewer-cache
│   │   └───viewer_history
│   └───shared
│       └───notebooks
│           └───511F7198-migrant-student-education
│               └───1
│                   ├───23B0409B3e0cda0f
│                   ├───23B0409B6b7da46e
│                   └───s
│                       ├───c24nh4kp2ubuk
│                       ├───c4ngovovgyl71
│                       ├───c6rmcrqi8dpo6
│                       ├───clza4e4qddvyx
│                       ├───csetup_chunk
│                       ├───cywi9m4c6gxef
│                       └───lib
│                           ├───bootstrap-3.3.5
│                           │   ├───css
│                           │   │   └───fonts
│                           │   ├───fonts
│                           │   ├───js
│                           │   └───shim
│                           ├───jquery-3.6.0
│                           ├───kePrint-0.0.1
│                           ├───lightable-0.0.1
│                           └───tabwid-1.1.3
├───cepsw1data
│   └───questionnaire
├───cepsw2data
│   └───questionnaire
├───migrant-student-education_files
│   └───figure-pdf
└───_extensions
    └───wjschne
        └───apaquarto
            └───typst
<!-- TREEVIEW END -->
