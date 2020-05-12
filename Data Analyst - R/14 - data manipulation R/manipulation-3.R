# Compute the mean duration for every start_station
mean_start_stn <- batrips[, .(mean_duration = mean(duration)), by = start_station]
mean_start_stn
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# Compute the mean duration for every start and end station
mean_station <- batrips[, .(mean_duration = mean(duration)), by = .(start_station, end_station)]
mean_station
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# Compute the mean duration grouped by start_station and month
mean_start_station <- batrips[, .(mean_duration = mean(duration)), by = .(start_station, mon = month(start_date))]
mean_start_station
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Compute min and max duration grouped by start station, end station, and month
aggregate_min_max <- batrips[, .(min_duration = min(duration), max_duration = max(duration)), by = .(start_station, end_station,mon = month(start_date))]
aggregate_min_max
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Arrange the total trips grouped by start_station and end_station in decreasing order
trips_dec <- batrips[, .N, by = .(start_station, 
                                  end_station)][order(-N)]
trips_dec
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====



# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====



# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====