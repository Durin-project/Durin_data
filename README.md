
This is the git repository for the [DURIN
project](https://betweenthefjords.w.uib.no/durin/). The goal of this
repo is to organize and streamline the data management in the project
and beyond.

<img src="pics/Circle_figure_Sticker.png" width="40%" />

## DATA MANAGEMENT

### Location of data, metadata and code

The overview of all the **datasets** is
[here](https://docs.google.com/spreadsheets/d/1KlQwSkcPa09POOSV0B7i_Z5KWcKDyw_Xu7Jikc9voyA/edit?usp=sharing).

The raw and clean **datasets** from are stored and will be made
available after the end of the project on [OSF](https://osf.io/f4v9t/).
For now the data is only available to the project partners.

All R code for the cleaning the raw data is available on the [Durin
GitHub](https://github.com/Durin-project).

The data documentation, including a draft for the data paper is
available
[here](https://docs.google.com/document/d/13Mky4gZfCzHIZl82zQKX6nb2vRneZXDRVDAmp0a3gdA/edit?usp=sharing)
(only available for authors), and the **data dictionaries** are in this
below in this readme file.

### Naming conventions for the clean datasets and files

We use **snake_case** for names and coding. Snake_case means that we use
lower case letters separated by an underscore, for example *biomass_g*
or *age_class*. The one exception are siteID, blockID, plotID (legacy
from previous projects).

**File and variable names should be meaningful**. Do not use
*my_data.csv* or *var1*. Follow the naming convention for the main
variables (see full description of the main variables in the table
below). Note that these naming conventions apply for clean datasets. For
field datasheets and raw data, the naming convention does not have to be
followed as strictly if other variable facilitate data collection
(e.g. splitting date into year, month and day to avoid excel issues).

We use **redundancy in variable names** to avoid mistakes. PlotID should
contain the higher hierarchical levels such as siteID, blockID,
treatment, habitat, species etc. For example plotID contains siteID,
habitat, species and plot number: LY_O_VV_1, LY_F_VM_3

| Files or variable | Naming convention | Example |
|:---|:---|:---|
| File name | Project_Status_Study_Approach_Response_Year(s).Extension | DURIN_clean_gradient_field_cflux_2023-2025.csv |
|  | Project | DURIN |
|  | Status | raw or clean |
|  | Study | *4corner*: study on the 4 main Durin sites; *droughtNet*: droughtNet experiment at Lygra and Tjotta (previously part of Landpress); *gradient*: gradient study between 4 corners; *nutrient*: nutrient experiment at Lygra; *climate_chamber*: climate chamber experiment in Oslo? |
|  | Approach | field, lab, molecular, other |
|  | Response | trait, biomass, flux, etc. |
|  |  |  |
| **4corner study** |  |  |
| date | Date of data collection | yyyy-mm-dd; do not split year, month and day into several columns |
| year | Year of data collection | yyyy; sometimes there is no specific date, then year can be used |
| site_name | Full site name | Lygra, Sogndal, Senja, Kautokeino and Tjotta |
| siteID | Unique siteID, first 2 letters of site_name. | LY, SO, SE, and KA, TJ |
| biogeography | Biogeography of the site | Boreal, Sub-arctic |
| oceanity | Oceanity of the site | Coast, Inland |
| habitat | Open versus forested habitat | Open, Forested |
| plot_nr | Plot number, numeric value from 1-5. | 1-5 |
| plotID | Unique plot ID as a combination of siteID, habitat, speciesID and plot number | LY_O_VV_1, KA_F_VM_5 |
| species | Vascular plant taxon names follow for Norway Elven et al. (2022). We use full species names. For field sheets the names can be abbreviated (see speciesID), but the clean data should contain the full species name | *Vaccinium myrtillus* |
| speciesID | 2 letter abbreviation of species | VM, VV, CV, EN, BN |
| plant_nr | Plant number, numeric value | 1-n |
| plantID | plantID is not defined but can be constructed by concatenate siteID, etc. | … |
| segment | S24 = growth in 2024, S23 = growth in 2023, S22 = growth in 2022 | S24, S23, S22 |
| variable | Response variable(s) | e.g. cover, biomass, Reco |
| value | Value of response variable(s) | numeric value |
| unit | Unit for response variable(s) | %, µmol m−2 s−1 |
| other variables | Other important variables in the dataset | remark, data collector, weather, flag |
|  |  |  |
| **DroughtNet experiment** |  |  |
| date | Date of data collection | yyyy-mm-dd; do not split year, month and day into several columns |
| year | Year of data collection | yyyy; sometimes there is no specific date, then year can be used |
| site_name | Site name | Lygra, Tjotta |
| siteID | Unique siteID, first 2 letters of site_name. | LY, TJ |
| … | … | North, South |
| habitat | Open habitat | Open |
| age_class | Age class of the vegetation representing post-fire successional stages. | pioneer, building, mature |
| age_classID | Age class ID of the vegetation representing post-fire successional stages. | PIO, BUI, MAT |
| drought_treatment | Drought treatment using rain-out shelters that reduce roof cover by 0 = ambient, 60 = moderate, or 90% = extreme | ambient, moderate, extreme |
| plot_nr | Unique plotID from the DroughtNet frames in the field. Correspond with Landpress naming. | 1.1,1.2,1.3 - 9.1,9.2,9.3 |
| plotID | Unique plot ID as a combination of siteID, age_class (3 first letters), drought_treatment (3 first letters) and plot number | LY_PIO_AMB_1.3, LY_MAT_EXT_9.1 (note these IDs might not exist!) |
| species | Vascular plant taxon names follow for Norway Elven et al. (2022). We use full species names. For field sheets the names can be abbreviated (see speciesID), but the clean data should contain the full species name | *Vaccinium myrtillus* |
| speciesID | 2 letter abbreviation of species | VM, VV, CV, EN |
| segment | S24 = growth in 2024, S23 = growth in 2023, S22 = growth in 2022 | S24, S23, S22 |
| variable | Response variable(s) | e.g. cover, biomass, Reco |
| value | Value of response variable(s) | numeric value |
| unit | Unit for response variable(s) | %, µmol m−2 s−1 |
| other variables | Other important variables in the dataset | remark, data collector, weather, flag |
|  |  |  |
| **Nutrient experiment** |  |  |
| date | Date of data collection | yyyy-mm-dd; do not split year, month and day into several columns |
| year | Year of data collection | yyyy; sometimes there is no specific date, then year can be used |
| site_name | Site name | Lygra |
| siteID | Unique siteID, first 2 letters of site_name. | LY |
| habitat | Open habitat | open |
| age_class | Vegetation representing post-fire successional stages. | building |
| nitrogen_addition | Added level of nitrogen kg ha-1 y-1 | 0, 1, 5, 10, 25 |
| block_nr | Block number as N plus numeric value | N1, N2, N3, N4, N5 |
| plotID | Unique plotID is combination of block number and nitrogen addition level | e.g. N1-10, N5-1 |
| segment | S24 = growth in 2024, S23 = growth in 2023, S22 = growth in 2022 | S24, S23, S22 |
| variable | Response variable(s) | e.g. cover, biomass, Reco |
| value | Value of response variable(s) | numeric value |
| unit | Unit for response variable(s) | %, µmol m−2 s−1 |
| other variables | Other important variables in the dataset | remark, data collector, weather, flag |
|  |  |  |
| **Gradient study** |  |  |
| date | Date of data collection | yyyy-mm-dd; do not split year, month and day into several columns |
| year | Year of data collection | yyyy; sometimes there is no specific date, then year can be used |
| siteID | ANO_flatID, Durin siteID_habitatID, Mika’s own system =\> VCG siteID |  |
| ANO_pointID | Only relevant for ANO flate. Numeric value from 11-66 | e.g. 11, 12 |
| NiN_type | NiN type | e.g. T31-C-1 |
| latitude_N | Decimal degree latitude | 69.54 °N |
| longitude_E | Decimal degree longitude | 4.54 °E |
| habitat | Open versus forested habitat, only relevant for Durin and VCG | open, forested |
| species | Vascular plant taxon names follow for Norway Lid & Lid (Lid J & Lid, 2010). We use full species names. For field sheets the names can be abbreviated (see speciesID), but the clean data should contain the full species name | *Vaccinium myrtillus* |
| speciesID | 2 letter abbreviation of species | VM, VV |
| individual_nr | Individual number as numeric value | 1-n |
| segment | S24 = growth in 2024, S23 = growth in 2023, S22 = growth in 2022 | S24, S23, S22 |
| collector | Full name separated by underscore of the person that collected the data. | I, me and myself |
| other variables | Other variables | … |

Data collections and experiments associated with **plant individuals**
and/or **leaves** should have unique IDs for each individual and leaf.
PlantID and leafID should contain redundancy of the higher levels, such
as siteID, plotID, treatments etc. but also make sure the IDs do not get
ridiculously long.

**Data collection might occur outside** of the plots from the studies
described above. For those samples include a new variable called
*sampling_plot*. The options for this variable are defined (sampling
inside a plot) and undefined (sampling outside the plots). The unique ID
for these samples will look something like: LY_O_1, SE_F_4

### Organize data sets

Each dataset should **contain only one response variable**, or several
if they are closely related. E.g. biomass and carbon flux should be two
separate datasets. But the functional trait dataset can contain several
traits, and the carbon flux dataset can contain GPP, NEE and Reco.

Datasets should be in a **long format**. If you have several response
variables (e.g. traits, flux measurements), then use
`pivot_long(cols = ..., names_to = "variable", values_to = "value")` to
conver the data to a long format. Using the names *variable* and *value*
for the columns is a standard. If you have very different response
variables, it can be useful to have a column called *unit*.

When dealing with many different datasets it can be useful to structure
them in a similar way. Arrange the dataset so that the important
variables come first, preferable use this order:

- Year and/or date
- siteID
- habitat
- treatment
- plotID
- species (focal)
- plantID
- leafID
- response variable, value, unit (diversity, biomass, flux)
- predictor variables (temperature level, oceanity)
- other_variables (remark, data collector, weather)

### Data dictionary

**How to make a data dictionary?**

The R package **dataDocumentation** that will help you to make the data
dictionary. You can install and load the package as follows:

``` r

# if needed install the remotes package
install.packages("remotes")

# then install the dataDocumentation package
remotes::install_github("audhalbritter/dataDocumentation")

# and load it
library(dataDocumentation)
```

*Make data description table*

Find the file *R/data_dic/data_description.xlsx*. Enter all the
variables into that table, including variable name, description,
unit/treatment level and how measured. If the variables are global for
all of Funder, leave TableID blank (e.g. siteID). If the variable is
unique for a specific dataset, create a TableID and use it consistently
for one specific dataset. Make sure you have described all variables.

*Make data dictionary*

Then run the function make_data_dic().

``` r

data_dic <- make_data_dictionary(data = biomass,
                                 description_table = description_table,
                                 table_ID = "biomass",
                                 keep_table_ID = FALSE)
```

Check that the function produces the correct data dictionary.

*Add data dictionary to readme file*

Finally, add the data dictionary below to be displayed in this readme
file. Add a title, and a code chunk using `kable()` to display the data
dictionary.

For more details go to the [dataDocumentation
readme](https://github.com/audhalbritter/dataDocumentation) file.

<img src="pics/data_dic.png" width="80%" />
