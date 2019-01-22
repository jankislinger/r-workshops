r-workshops
===========

Presentations and tutorial scripts for workshops in R

Upcoming workshops
------------------

    require(tidyverse)

    ## Loading required package: tidyverse

    ## ── Attaching packages ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse 1.2.1 ──

    ## ✔ ggplot2 3.1.0     ✔ purrr   0.2.5
    ## ✔ tibble  1.4.2     ✔ dplyr   0.7.7
    ## ✔ tidyr   0.8.1     ✔ stringr 1.3.1
    ## ✔ readr   1.1.1     ✔ forcats 0.3.0

    ## ── Conflicts ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

    require(jsonlite)

    ## Loading required package: jsonlite

    ## 
    ## Attaching package: 'jsonlite'

    ## The following object is masked from 'package:purrr':
    ## 
    ##     flatten

    require(knitr)

    ## Loading required package: knitr

    workshop_dates <- read_json('admin/workshop_dates.json', simplifyDataFrame = T)
    locations <- read_json('admin/locations.json', simplifyDataFrame = T)

    left_join(workshop_dates, locations, by = c('location' = 'key'), suffix = c('_ws', '_loc')) %>% 
      mutate(organizer = 'minervo',
             location = paste0('[', name, '](', url_loc, ')'),
             register = paste0('[', organizer, '](', url_ws, ')')) %>% 
      select('Název' = title, 'Datum' = date, 'Čas' = time, 'Učebna' = location, 'Registrace' = register) %>% 
      kable()

<table>
<thead>
<tr class="header">
<th align="left">Název</th>
<th align="left">Datum</th>
<th align="left">Čas</th>
<th align="left">Učebna</th>
<th align="left">Registrace</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Úvod do datové analýzy I</td>
<td align="left">2018-10-31</td>
<td align="left">17:30 - 21:00</td>
<td align="left"><a href="https://goo.gl/maps/N9p499oAagv">UP21 incubator</a></td>
<td align="left"><a href="https://www.minervo.cz/events/uvod-do-datove-analyzy-vizualizace-a-machine-learningu-v-r-workshop-1">minervo</a></td>
</tr>
<tr class="even">
<td align="left">Úvod do datové analýzy II</td>
<td align="left">2018-11-06</td>
<td align="left">17:30 - 21:00</td>
<td align="left"><a href="https://goo.gl/maps/qLLukNidkZA2">Animika Hub</a></td>
<td align="left"><a href="https://www.minervo.cz/events/uvod-do-datove-analyzy-vizualizace-a-machine-learningu-v-r-workshop-1">minervo</a></td>
</tr>
<tr class="odd">
<td align="left">Úvod do datové analýzy III</td>
<td align="left">2018-11-13</td>
<td align="left">17:30 - 21:00</td>
<td align="left"><a href="https://goo.gl/maps/njiVc7DCqsT2">Opero</a></td>
<td align="left"><a href="https://www.minervo.cz/events/uvod-do-datove-analyzy-vizualizace-a-machine-learningu-v-r-workshop-1">minervo</a></td>
</tr>
</tbody>
</table>

Semináře
--------

### Úvod do datové analýzy

Série tří seminářů vám pomůže rychle se zorientovat v jazyce R a
prostředí RStudia. Budeme se věnovat zejména analýze dat "tidy"
přístupem - tedy pomocí knihoven shrnutých do balíku *tidyverse*. Během
všech částí projdeme kompletně celou oblast manipulace s daty a
vizualizace - od úplných začátků po pokročilé metody.

Pro koho je seminář určen:

-   Lidé bez zkušeností s jazykem R, kteří mají nějakou zkušenost s
    některým z nástrojů pro práci s daty: Excel, SQL, nebo Python.
-   Mírně pokročilí v R, kteří dosud nevyužívali knihovnu tidyverse.

Více informací o semináři na [zvláštní
stránce](https://github.com/jankislinger/r-workshops/tree/master/introduction).

#### Část I

-   Úvod do jazyka R a RStudia
-   Zdroje pro další vzdělávání a pomoc
-   Úvod do `tidyverse`
-   Načítání dat z RData, csv a Excelu (readr, readxl)
-   Základy manipulace s daty (dplyr)
-   Základy vizualizace (ggplot2)

#### Část II

-   Agregování skupinových dat (dplyr)
-   Vizualizace skupinových dat (ggplot2)
-   Funkcionální programování (purrr)
-   Načítání dat z SQL (dbplyr)

#### Část III

-   Operace s textem (stringr, tidyr)
-   Pokročilá manipulace s daty (dplyr, tidyr)
-   Shrnutí procesu load-transform-vizualize

### Specialized workshops

#### Neural Networks in R

#### Web Scraping

#### Programming in R

#### Package Development
