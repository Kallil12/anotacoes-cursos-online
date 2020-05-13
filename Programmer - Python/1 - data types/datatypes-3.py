# exercise 1
# Import the Counter object
from collections import Counter

# Print the first ten items from the stations list
print(stations[0:10])

# Create a Counter of the stations list: station_count
station_count = Counter(stations)

# Print the station_count
print(station_count)
# ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- ----//----
# exercise 2
# Import the Counter object
from collections import Counter

# Create a Counter of the stations list: station_count
station_count = Counter(stations)

# Find the 5 most common elements
print(station_count.most_common(5))
# ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- ----//----
# exercise 3
# Create an empty dictionary: ridership
ridership = {}

# Iterate over the entries
for date, stop, riders in entries:
    # Check to see if date is already in the ridership dictionary
    if date not in ridership:
        # Create an empty list for any missing date
        ridership[date] = []
    # Append the stop and riders as a tuple to the date keys list
    ridership[date].append((stop,riders))
    
# Print the ridership for '03/09/2016'
print(ridership['03/09/2016'])

# ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- ----//----
# exercise 4
# Import defaultdict
from collections import defaultdict

# Create a defaultdict with a default type of list: ridership
ridership = defaultdict(list)

# Iterate over the entries
for date, stop, riders in entries:
    # Use the stop as the key of ridership and append the riders to its value
    ridership[stop].append(riders)
    
# Print the first 10 items of the ridership dictionary
# Import defaultdict
from collections import defaultdict

# Create a defaultdict with a default type of list: ridership
ridership = defaultdict(list)

# Iterate over the entries
for date, stop, riders in entries:
    # Use the stop as the key of ridership and append the riders to its value
    ridership[stop].append(riders)
    
# Print the first 10 items of the ridership dictionary
print(list(ridership.items())[:10])
# ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- ----//----
# exercise 5
# Import OrderedDict from collections
from collections import OrderedDict

# Create an OrderedDict called: ridership_date
ridership_date = OrderedDict()

# Iterate over the entries
for date, riders in entries:
    # If a key does not exist in ridership_date, set it to 0
    if  date not in ridership_date:
        ridership_date[date] = 0
        
    # Add riders to the date key in ridership_date
    ridership_date[date] += riders
    
# Print the first 31 records
print(list(ridership_date.items())[:31])
# ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- ----//----
# exercise 6
# Print the first key in ridership_date
print(list(ridership_date.keys())[0])

# Pop the first item from ridership_date and print it
print(ridership_date.popitem(last=False))

# Print the last key in ridership_date
print(list(ridership_date.keys())[-1])

# Pop the last item from ridership_date and print it
print(ridership_date.popitem())