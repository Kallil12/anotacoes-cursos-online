# exercise 1

# Initialize offset
offset = 8

# Code the while loop
while offset != 0:
    print("correcting...")
    offset = offset -1
    print(offset)

# ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- 
# exercise 2

# Initialize offset
offset = -6

# Code the while loop
while offset != 0 :
    print("correcting...")
    if offset > 0 :
      offset = offset+1
    else : 
      offset = offset+1    
    print(offset)

# ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- 
# exercise 3

# areas list
areas = [11.25, 18.0, 20.0, 10.75, 9.50]

# Code the for loop
for area in areas:
    print(area)

# ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- 
# exercise 4

# areas list
areas = [11.25, 18.0, 20.0, 10.75, 9.50]

# Change for loop to use enumerate() and update print()
for index,area in enumerate(areas) :
    print("room"+ str(index)+ ": " +str(area))

# ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- 
# exercise 5

# areas list
areas = [11.25, 18.0, 20.0, 10.75, 9.50]

# Code the for loop
for index, area in enumerate(areas) :
    aux = index + 1
    print("room " + str(aux) + ": " + str(area))

# ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- 
# exercise 6

# house list of lists
house = [["hallway", 11.25], 
         ["kitchen", 18.0], 
         ["living room", 20.0], 
         ["bedroom", 10.75], 
         ["bathroom", 9.50]]
         
# Build a for loop from scratch

for space, area in house:
    print("the "+str(space) + " is " +str(area)+ " sqm")

# ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- 
# exercise 7

# Definition of dictionary
europe = {'spain':'madrid', 'france':'paris', 'germany':'berlin',
          'norway':'oslo', 'italy':'rome', 'poland':'warsaw', 'austria':'vienna' }
          
# Iterate over europe
for country,capital in europe.items():
    print("the capital of " + country + " is " + str(capital))

# ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- 
# exercise 8

# Import numpy as np
import numpy as np

# For loop over np_height
for value1 in np_height:
    print(str(value1) + " inches")

# For loop over np_baseball
for value2 in np.nditer(np_baseball):
    print(value2)

# ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- 
# exercise 9

# Import cars data
import pandas as pd
cars = pd.read_csv('cars.csv', index_col = 0)

# Iterate over rows of cars
for a,b in cars.iterrows():
    print(a)
    print(b)

# ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- 
# exercise 10

# Import cars data
import pandas as pd
cars = pd.read_csv('cars.csv', index_col = 0)

# Adapt for loop
for lab, row in cars.iterrows() :
    #print(lab)
    #print(row)
    print(lab + ": " + str(row["cars_per_cap"]))

# ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- 
# exercise 11

# Import cars data
import pandas as pd
cars = pd.read_csv('cars.csv', index_col = 0)

# Code for loop that adds COUNTRY column
for labels, rows in cars.iterrows():
    cars.loc[labels, "COUNTRY"] = rows["country"].upper()

# Print cars
print(cars)

# ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- 
# exercise 12

# Import cars data
import pandas as pd
cars = pd.read_csv('cars.csv', index_col = 0)

# Use .apply(str.upper)
#for lab, row in cars.iterrows() :
#    cars.loc[lab, "COUNTRY"] = row["country"].upper()
    
cars["COUNTRY"] = cars["country"].apply(str.upper)
    
print(cars)

# ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- 