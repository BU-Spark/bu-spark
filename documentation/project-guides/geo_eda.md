---
layout: default
title: Getting Started With Geographical Exploratory Data Analysis
parent: Data Science Project Documentation Guidelines
nav_order: 5
---

# Getting Started With GeoPandas

This notebook serves as a starter guide or template for doing geographical analysis using the GeoPandas library. 

The dataset we will be using in this tutorial is from Analyze Boston. Analyze Boston is the City of Boston’s data hub and is a great resource for data sets regarding the city.

We will be working with two datasets. First is the 2020 CENSUS TRACTS IN BOSTON dataset, and second is the WICKED FREE WIFI LOCATIONS dataset. The first dataset contains the geographical boundaries of each census tract in Boston, and the second dataset contains the geographical location of each free wifi location in Boston.

[Census Tracts in Boston](https://data.boston.gov/dataset/2020-census-tracts-in-boston1/resource/0eb72f57-7226-4552-b8e1-a76b6b142bc3)

[Wicked Free Wifi Locations](https://data.boston.gov/dataset/wicked-free-wifi-locations)



```python
# Start by importing the necessary packages
import pandas as pd
import geopandas as gpd
from shapely.geometry import Point, Polygon

# for visualizations : 
import seaborn as sns
import matplotlib.pyplot as plt
```

When working with geographical data, .shp files are the most common format, however these files are often accompanied by other files with the same name but different extensions. For example, a .shp file might come with a .dbf, .prj, .shx, and .cpg file. These are necessary files and are used in the background. GeoPandas (and other GIS software) typically expect these files to be in the same directory as the .shp file and to share the same base filename.







```python
# read in the census data
census = gpd.read_file('data/Census2020_BlockGroups.shp')
census.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>OBJECTID</th>
      <th>STATEFP20</th>
      <th>COUNTYFP20</th>
      <th>TRACTCE20</th>
      <th>BLKGRPCE20</th>
      <th>GEOID20</th>
      <th>NAMELSAD20</th>
      <th>MTFCC20</th>
      <th>FUNCSTAT20</th>
      <th>ALAND20</th>
      <th>AWATER20</th>
      <th>INTPTLAT20</th>
      <th>INTPTLON20</th>
      <th>Shape_STAr</th>
      <th>Shape_STLe</th>
      <th>geometry</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>25</td>
      <td>025</td>
      <td>040600</td>
      <td>1</td>
      <td>250250406001</td>
      <td>Block Group 1</td>
      <td>G5030</td>
      <td>S</td>
      <td>1265377.0</td>
      <td>413598.0</td>
      <td>+42.3833695</td>
      <td>-071.0707743</td>
      <td>1.807118e+07</td>
      <td>29256.866068</td>
      <td>POLYGON ((769378.692 2964626.314, 769385.078 2...</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>25</td>
      <td>025</td>
      <td>051101</td>
      <td>1</td>
      <td>250250511011</td>
      <td>Block Group 1</td>
      <td>G5030</td>
      <td>S</td>
      <td>220626.0</td>
      <td>0.0</td>
      <td>+42.3882285</td>
      <td>-071.0046816</td>
      <td>2.374654e+06</td>
      <td>9142.174252</td>
      <td>POLYGON ((788317.786 2966115.262, 788838.563 2...</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>25</td>
      <td>025</td>
      <td>051101</td>
      <td>4</td>
      <td>250250511014</td>
      <td>Block Group 4</td>
      <td>G5030</td>
      <td>S</td>
      <td>227071.0</td>
      <td>270.0</td>
      <td>+42.3913407</td>
      <td>-071.0020343</td>
      <td>2.446949e+06</td>
      <td>11579.546171</td>
      <td>POLYGON ((789538.125 2967889.427, 789539.214 2...</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>25</td>
      <td>025</td>
      <td>981600</td>
      <td>1</td>
      <td>250259816001</td>
      <td>Block Group 1</td>
      <td>G5030</td>
      <td>S</td>
      <td>586981.0</td>
      <td>158777.0</td>
      <td>+42.3886205</td>
      <td>-070.9934424</td>
      <td>8.026752e+06</td>
      <td>16626.718823</td>
      <td>POLYGON ((790938.417 2966482.118, 790974.619 2...</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>25</td>
      <td>025</td>
      <td>010204</td>
      <td>3</td>
      <td>250250102043</td>
      <td>Block Group 3</td>
      <td>G5030</td>
      <td>S</td>
      <td>145888.0</td>
      <td>0.0</td>
      <td>+42.3459611</td>
      <td>-071.1020344</td>
      <td>1.570220e+06</td>
      <td>5510.560013</td>
      <td>POLYGON ((762928.668 2951612.031, 763063.607 2...</td>
    </tr>
  </tbody>
</table>
</div>



What makes a .shp file unique is the "geometry" column. The geometry column typically contains the coordinates or geometric properties of the features represented in the shapefile, such as points, lines, or polygons. For us, each row in our shapefile represents one census block group, and the geometry column stores a vectorized polygon boundaries of each block group that lets us see a visual representation of the block group.


```python
census['geometry'][0]
```




    
![svg](geo_eda_pngs/output_6_0.svg)
    



We can plot all of these block groups together to get a visual representation of the city of Boston.


```python
census.plot()
plt.title('Boston Census Block Groups')
plt.show()
```


    
![png](geo_eda_pngs/output_8_0.png)
    


Now let's read in our Wicked Free Wifi Locations shapefile


```python
# read in the wifi locations shapefile
wfw = gpd.read_file('wifi/Wicked_Free_WiFi_Locations.shp')
wfw
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>neighborho</th>
      <th>neighbor_1</th>
      <th>device_ser</th>
      <th>device_con</th>
      <th>device_add</th>
      <th>device_lat</th>
      <th>device_lon</th>
      <th>device_tag</th>
      <th>etl_update</th>
      <th>is_current</th>
      <th>org1</th>
      <th>org2</th>
      <th>inside_out</th>
      <th>landmark</th>
      <th>ObjectId</th>
      <th>geometry</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>N_568579452955534204</td>
      <td>Dorchester</td>
      <td>Q2CK-H48M-P2E9</td>
      <td>DOT-BFD21-AP3</td>
      <td>641 Columbia Rd., Dorchester, MA</td>
      <td>42.318336</td>
      <td>-71.063236</td>
      <td>BFD Engine-21 Outside</td>
      <td>2023-06-12</td>
      <td>1</td>
      <td>BFD</td>
      <td>NaN</td>
      <td>Outside</td>
      <td>Engine 21</td>
      <td>1</td>
      <td>POINT (-7910723.209 5208784.596)</td>
    </tr>
    <tr>
      <th>1</th>
      <td>N_568579452955537848</td>
      <td>South Boston</td>
      <td>Q2CK-LEG8-FAFN</td>
      <td>SB-HIGHSCHOOL-AP2</td>
      <td>95 G St., South Boston, MA</td>
      <td>42.332869</td>
      <td>-71.044891</td>
      <td>recently-added</td>
      <td>2023-06-12</td>
      <td>1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>2</td>
      <td>POINT (-7908681.044 5210972.710)</td>
    </tr>
    <tr>
      <th>2</th>
      <td>N_568579452955538316</td>
      <td>Hyde Park</td>
      <td>Q2CK-NERF-4JX7</td>
      <td>HP-BPDE18-AP2</td>
      <td>1249 Hyde Park Ave., Hyde Park, MA</td>
      <td>42.256473</td>
      <td>-71.124219</td>
      <td>recently-added</td>
      <td>2023-06-12</td>
      <td>1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>3</td>
      <td>POINT (-7917511.803 5199475.676)</td>
    </tr>
    <tr>
      <th>3</th>
      <td>N_579275502070532581</td>
      <td>Roxbury</td>
      <td>Q2CK-DSFT-7HTL</td>
      <td>ROX-TROTTER-AP3</td>
      <td>Humbolt &amp; Waumbeck St., Roxbury, MA</td>
      <td>42.313249</td>
      <td>-71.089180</td>
      <td>BPS Outside Trotter-School</td>
      <td>2023-06-12</td>
      <td>1</td>
      <td>BPS</td>
      <td>NaN</td>
      <td>Outside</td>
      <td>Trotter School</td>
      <td>4</td>
      <td>POINT (-7913611.287 5208018.690)</td>
    </tr>
    <tr>
      <th>4</th>
      <td>N_579275502070532581</td>
      <td>Roxbury</td>
      <td>Q2CK-2D9P-VKGR</td>
      <td>ROX-BFDE42-AP1</td>
      <td>1870 Columbus Ave., Roxbury, MA</td>
      <td>42.318412</td>
      <td>-71.097758</td>
      <td>BFD Engine-42 Outside</td>
      <td>2023-06-12</td>
      <td>1</td>
      <td>BFD</td>
      <td>NaN</td>
      <td>Outside</td>
      <td>Engine 42</td>
      <td>5</td>
      <td>POINT (-7914566.172 5208795.947)</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>255</th>
      <td>N_568579452955534204</td>
      <td>Dorchester</td>
      <td>Q2CK-G9M2-VTK4</td>
      <td>DOT-BFD21-AP2</td>
      <td>641 Columbia Rd., Dorchester, MA</td>
      <td>42.318336</td>
      <td>-71.063236</td>
      <td>BFD Engine-21 Outside</td>
      <td>2023-06-12</td>
      <td>1</td>
      <td>BFD</td>
      <td>NaN</td>
      <td>Outside</td>
      <td>Engine 21</td>
      <td>256</td>
      <td>POINT (-7910723.209 5208784.596)</td>
    </tr>
    <tr>
      <th>256</th>
      <td>N_568579452955527921</td>
      <td>Parks</td>
      <td>Q2CK-MP93-YDN3</td>
      <td>PARKS-COMMONEAST-AP1</td>
      <td>139 Tremont St, Boston, MA 02111</td>
      <td>42.355436</td>
      <td>-71.063827</td>
      <td>Boston-Common</td>
      <td>2023-06-12</td>
      <td>1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Boston Common</td>
      <td>257</td>
      <td>POINT (-7910789.066 5214371.556)</td>
    </tr>
    <tr>
      <th>257</th>
      <td>L_601230550253962688</td>
      <td>Navy Yard</td>
      <td>Q2EK-HAXQ-8XW4</td>
      <td>NavyYard-AP2</td>
      <td>Navy yard Cambridge</td>
      <td>42.373720</td>
      <td>-71.053272</td>
      <td>NaN</td>
      <td>2023-06-12</td>
      <td>1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>258</td>
      <td>POINT (-7909614.112 5217126.360)</td>
    </tr>
    <tr>
      <th>258</th>
      <td>N_568579452955534204</td>
      <td>Dorchester</td>
      <td>Q2CK-NJQU-RB55</td>
      <td>DOT-MATHER-AP3</td>
      <td>24 Parrish St, Dorchester</td>
      <td>42.308397</td>
      <td>-71.061017</td>
      <td>recently-added</td>
      <td>2023-06-12</td>
      <td>1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>259</td>
      <td>POINT (-7910476.256 5207288.280)</td>
    </tr>
    <tr>
      <th>259</th>
      <td>N_579275502070532581</td>
      <td>Roxbury</td>
      <td>Q2CK-NEZE-VRYJ</td>
      <td>ROX-VINE-AP3</td>
      <td>339 Dudley St, Roxbury</td>
      <td>42.326811</td>
      <td>-71.076707</td>
      <td>recently-added</td>
      <td>2023-06-12</td>
      <td>1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>260</td>
      <td>POINT (-7912222.881 5210060.516)</td>
    </tr>
  </tbody>
</table>
<p>260 rows × 16 columns</p>
</div>



This time, our geometry column are single POINTs rather than whole POLYGONs, which makes sense because each row represents a single wifi location. After plotting them all together we see just a bunch of dots, which is not very helpful. We can make this plot more useful by adding the census block groups to the plot as well.


```python
wfw.plot()
plt.title('Wifi Locations')
plt.show()
```


    
![png](geo_eda_pngs/output_12_0.png)
    


## Data Cleaning


```python
print(census.shape)

print(wfw.shape)
```

    (581, 16)
    (260, 16)
    


```python
census.info()
```

    <class 'geopandas.geodataframe.GeoDataFrame'>
    RangeIndex: 581 entries, 0 to 580
    Data columns (total 16 columns):
     #   Column      Non-Null Count  Dtype   
    ---  ------      --------------  -----   
     0   OBJECTID    581 non-null    int64   
     1   STATEFP20   581 non-null    object  
     2   COUNTYFP20  581 non-null    object  
     3   TRACTCE20   581 non-null    object  
     4   BLKGRPCE20  581 non-null    object  
     5   GEOID20     581 non-null    object  
     6   NAMELSAD20  581 non-null    object  
     7   MTFCC20     581 non-null    object  
     8   FUNCSTAT20  581 non-null    object  
     9   ALAND20     581 non-null    float64 
     10  AWATER20    581 non-null    float64 
     11  INTPTLAT20  581 non-null    object  
     12  INTPTLON20  581 non-null    object  
     13  Shape_STAr  581 non-null    float64 
     14  Shape_STLe  581 non-null    float64 
     15  geometry    581 non-null    geometry
    dtypes: float64(4), geometry(1), int64(1), object(10)
    memory usage: 72.8+ KB
    


```python
wfw.info()
```

    <class 'geopandas.geodataframe.GeoDataFrame'>
    RangeIndex: 260 entries, 0 to 259
    Data columns (total 16 columns):
     #   Column      Non-Null Count  Dtype   
    ---  ------      --------------  -----   
     0   neighborho  260 non-null    object  
     1   neighbor_1  260 non-null    object  
     2   device_ser  260 non-null    object  
     3   device_con  250 non-null    object  
     4   device_add  245 non-null    object  
     5   device_lat  248 non-null    float64 
     6   device_lon  248 non-null    float64 
     7   device_tag  215 non-null    object  
     8   etl_update  260 non-null    object  
     9   is_current  260 non-null    int64   
     10  org1        119 non-null    object  
     11  org2        5 non-null      object  
     12  inside_out  162 non-null    object  
     13  landmark    168 non-null    object  
     14  ObjectId    260 non-null    int64   
     15  geometry    248 non-null    geometry
    dtypes: float64(2), geometry(1), int64(2), object(11)
    memory usage: 32.6+ KB
    

Doesn't look like there's much to clean in the census data, but in the wifi dataset let's just drop the organization columns because they contain the most nulls, and we don't need them for our analysis.


```python
wfw.drop(['org1', 'org2'], axis=1, inplace=True)
```

## Showing the wifi locations on our census block group map

So we can see a map of Boston and a map of dots representing wifi locations separately, but how do I overlay these dots on top of the map of Boston to actuall see where in Boston these wifi locations are? First, check that the Coordinate Reference Systems (CRS) of both geodataframes are the same. The CRS specifies the coordinate system and reference frame used to define the spatial positions of the features represented in the file, and in order to overlay two geodataframes, they must have the same CRS.


```python
# Check the CRS of both GeoDataFrames
print("Census CRS: ", census.crs)
print("Wifi CRS: ", wfw.crs)
```

    Census CRS:  PROJCS["NAD83 / Massachusetts Mainland (ftUS)",GEOGCS["NAD83",DATUM["North_American_Datum_1983",SPHEROID["GRS 1980",6378137,298.257222101,AUTHORITY["EPSG","7019"]],AUTHORITY["EPSG","6269"]],PRIMEM["Greenwich",0],UNIT["Degree",0.0174532925199433]],PROJECTION["Lambert_Conformal_Conic_2SP"],PARAMETER["latitude_of_origin",41],PARAMETER["central_meridian",-71.5],PARAMETER["standard_parallel_1",41.7166666666667],PARAMETER["standard_parallel_2",42.6833333333333],PARAMETER["false_easting",656166.666666667],PARAMETER["false_northing",2460625],UNIT["US survey foot",0.304800609601219,AUTHORITY["EPSG","9003"]],AXIS["Easting",EAST],AXIS["Northing",NORTH]]
    Wifi CRS:  EPSG:3857
    

Since they're different, we need to use the to_crs method to make sure they're all in the same coordinate system. We'll use the EPSG:4326 coordinate system, which is one of the most common coordinate systems for geographical data. Then, we can overlay the two plots using matplotlib.


```python
# If they're different, reproject the wifi data to match the census data
if census.crs != wfw.crs:
    census = census.to_crs(wfw.crs)

# Create a new figure and axis
fig, ax = plt.subplots(1, 1)

# Plot the census data
census.plot(ax=ax, color='gray')

# Plot the wifi locations
wfw.plot(ax=ax, color='red', markersize=10, alpha=0.2)

plt.title("Boston Census Block Groups and Wifi Locations")
plt.show()
```


    
![png](geo_eda_pngs/output_23_0.png)
    


If you want to zoom in on a specific area of a map in GeoPandas, you need to add the lines: plt.xlim() and plt.ylim(). These functions take in the xmin and xmax, and ymin and ymax values of the area you want to zoom in on. You can find these values by looking at the x and y axes of the original plot.


```python
# Same as before
if census.crs != wfw.crs:
    census = census.to_crs(wfw.crs)
fig, ax = plt.subplots(1, 1)
census.plot(ax=ax, color='gray')
wfw.plot(ax=ax, color='red', markersize=10, alpha=0.2)
plt.title("Zoomed in Boston Census Block Groups and Wifi Locations")


# Set the x and y limits to zoom in on Boston
plt.xlim([-7.915e6, -7.91e6])  # xmin and xmax
plt.ylim([5.2075e6, 5.2125e6])  # ymin and ymax

plt.show()
```


    
![png](geo_eda_pngs/output_25_0.png)
    


## Make a Choropleth (color each census block according to the number of WiFi locations in it):


Now that both of our GeoDataFrames are on the same CRS, we can do a spatial join to find out how many WiFi locations are in each census tract. A spatial join is a type of join that merges two GeoDataFrames based on the spatial relationship between the geometries of the two GeoDataFrames. In this case, we want to know how many WiFi locations are in each census tract, so we will use the contains operation to find all of the WiFi locations that are within each census tract.




```python
# Perform a spatial join between the census tracts and WiFi locations
wifi_per_tract = gpd.sjoin(census, wfw, predicate='contains').groupby('TRACTCE20').size()
wifi_per_tract.head()
```




    TRACTCE20
    000301     1
    000603     3
    000604     1
    000805     1
    030302    35
    dtype: int64



The "contains" operation (as well as other spatial operations like "intersects", "within", etc.) uses geometric calculations based on the shapes' coordinates (which have the same CRS) to determine spatial relationships.

For the "contains" operation specifically, it checks if all points of the other geometric object are within the current geometric object, and that their boundaries do not coincide.

For example:


```python
from shapely.geometry import Point, Polygon

# Create a 5x5 square (tract)
polygon = Polygon([(0, 0), (5, 0), (5, 5), (0, 5)])

# Create two points (WiFi location)
point1 = Point(3, 3)  # Inside the polygon
point2 = Point(6, 6)  # Outside the polygon

# Check containment
print(polygon.contains(point1))
print(polygon.contains(point2))  

```

    True
    False
    

We can now groupby the unique 'TRACTCE20' values and take .size() to get the number of wifi locations in each tract. Then, we can merge this with our census dataframe to get a new column with the number of wifi locations in each census tract.


```python
# Add a new column to the census GeoDataFrame with the count of WiFi locations per tract
census = census.merge(wifi_per_tract.rename('wifi_count'), how='left', left_on='TRACTCE20', right_index=True)

# Replace NaN values (tracts without any WiFi location) with 0
census['wifi_count'].fillna(0, inplace=True)

# Now, create a new figure and axis
fig, ax = plt.subplots(1, 1, figsize=(10, 10))

# Plot the census data, color-coded by the number of WiFi locations
census.plot(column='wifi_count', ax=ax, legend=True, cmap='cividis', 
            legend_kwds={'label': "Number of WiFi Locations per Tract",
                         'orientation': "horizontal"})

plt.title("Number of WiFi Locations per Tract")
plt.show()

```


    
![png](geo_eda_pngs/output_31_0.png)
    



```python
census[census['wifi_count'] == census['wifi_count'].max()]['wifi_count']
```




    478    35.0
    Name: wifi_count, dtype: float64



Looks like there's 35 free wifi locations in this bright yellow tract, maybe the 'landmarks' column will tell us why...


```python
wfw['landmark'].value_counts().head(5).sort_values().plot(kind='barh', figsize=(10, 10))
plt.title('Number of WiFi Locations by Landmark')
plt.xlabel('Number of WiFi Locations')
plt.ylabel('Landmark')
plt.show()
```


    
![png](geo_eda_pngs/output_34_0.png)
    


So it could be the City Hall, let's graph it! 


```python
city_hall_wifi = wfw[wfw['landmark'] == 'City Hall']

if census.crs != city_hall_wifi.crs:
    city_hall_wifi = city_hall_wifi.to_crs(census.crs)

fig, ax = plt.subplots()
census.plot(ax=ax, color='grey', edgecolor='black')
city_hall_wifi.plot(ax=ax, color='red', markersize=10)
plt.title('WiFi Locations at City Hall')
plt.show()
```


    
![png](geo_eda_pngs/output_36_0.png)
    


Looks like we're right! After plotting the subset of our dataframe where Landmark == "City Hall", we can see that all of these points are clustered in that bright yellow census tract. Looking at the listed address of these WiFi locations, we can see that they are all located at 1 City Hall Square, which is the address of Boston City Hall.

Here are the unique device addresses of these city hall wifi locations:


```python
city_hall_wifi['device_add'].unique()
```




    array(['1 City Hall Square, Boston, MA 02201',
           '1 City Hall Plaza, Pavilion\nBoston, MA  02201',
           'One City Hall Sq, Pavilion Bldg\nBoston, MA 02201', nan,
           '1 City Hall Plaza, \nBoston, MA  02201',
           'One City Hall Sq, Pavilion Bld, IWF Room,\nBoston, MA 02201'],
          dtype=object)



## Inside vs Outside Wifi locations


```python
fig, ax = plt.subplots(1, 1)

census.plot(ax=ax, color='gray')

# Plot the wifi locations with color based on "inside_out" column
wfw.plot(ax=ax, column='inside_out', cmap='cool', markersize=10, legend=True, alpha=0.2)

plt.title("Boston Census Block Groups and Wifi Locations")
plt.show()

```


    
![png](geo_eda_pngs/output_40_0.png)
    



```python
wfw['inside_out'].value_counts().plot(kind='barh')
plt.show()
```


    
![png](geo_eda_pngs/output_41_0.png)
    


Looks like most of our WiFi locations are outside. There's probably a lot of "regular" EDA that can be done here, but since this is a GeoPandas/geographical analysis notebook, we'll just leave it at that. 

## Closest Wifi location to BU


```python
from geopy.distance import geodesic

# Coordinates of Boston University (accordign to Google)
BU_latitude = 42.3505
BU_longitude = -71.1054

# Create a copy of the WiFi locations and drop rows with missing coordinates
wfw = wfw.copy()
wfw.dropna(subset=['device_lat', 'device_lon'], inplace=True)


# Function to calculate distances to BU
def calculate_distance(row):
    point = (row['device_lat'], row['device_lon'])
    return geodesic(point, (BU_latitude, BU_longitude)).miles

wfw['distance_to_BU'] = wfw.apply(calculate_distance, axis=1)

# Find the WiFi location with the minimum distance
wfw[wfw['distance_to_BU'] == min(wfw['distance_to_BU'])]

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>neighborho</th>
      <th>neighbor_1</th>
      <th>device_ser</th>
      <th>device_con</th>
      <th>device_add</th>
      <th>device_lat</th>
      <th>device_lon</th>
      <th>device_tag</th>
      <th>etl_update</th>
      <th>is_current</th>
      <th>inside_out</th>
      <th>landmark</th>
      <th>ObjectId</th>
      <th>geometry</th>
      <th>distance_to_BU</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>36</th>
      <td>N_601230550253961587</td>
      <td>BCYF Tremont</td>
      <td>Q2FD-4SE4-JW2S</td>
      <td>BCYF-3rd FL GED</td>
      <td>1483 Tremont St, Boston, MA</td>
      <td>42.332317</td>
      <td>-71.09865</td>
      <td>BCYF Inside employee</td>
      <td>2023-06-12</td>
      <td>1</td>
      <td>Inside</td>
      <td>employee</td>
      <td>37</td>
      <td>POINT (-7914665.525 5210889.576)</td>
      <td>1.301774</td>
    </tr>
  </tbody>
</table>
</div>



In order to find the closest wifi location to BU, we need to find the distance between each wifi location and BU. We can do this using the geodesic function from geopy, which returns the distance between two longitudes/latitudes. Then, we can find the row where the distance is the smallest, which will be the closest wifi location to BU.

The closest wifi location to BU is the one at 1483 Tremont St, Boston, MA. It's about 1.3 miles away from BU. Let's plot it!



```python
fig, ax = plt.subplots(1, 1)

# Plot the census data
census.plot(ax=ax, color='gray')

# Plot the wifi locations
wfw.plot(ax=ax, color='blue', markersize=10, alpha=0.2)

# Plot the WiFi location closest to BU in red
wfw.query("device_ser == 'Q2FD-4SE4-JW2S'").plot(ax=ax, color='red', markersize=20)
plt.title("1483 Tremont Street and other Wifi Locations")
plt.show()
```


    
![png](geo_eda_pngs/output_46_0.png)
    


## Wrap Up, Next Steps

There's a lot more you can do with these datasets, for example, you could try finding the average distance between wifi locations, or incorporate another dataset with demographic information and try to find a relationship between income, education level, population density, etc and wifi locations. but this notebook should serve as a good starting point for your geographical analysis. 

Click [here](https://drive.google.com/drive/u/1/folders/1J5-9x_gEDeJ2rbuRw-kMlnE4GsZjbJN1) to download this Jupyter Notebook (make sure you are signed in with your BU email)!
