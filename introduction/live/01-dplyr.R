require(dplyr)


# select ------------------------------------------------------------------

select(cameras, lat, long)
select(cameras, starts_with('name'))
select(cameras, -externalid)
select(cameras, externalid:long)

select(cameras, externalid, everything())
select(cameras, everything())

select(cameras, one_of('name'))
select(cameras, lat, long, one_of('name2'))
select(cameras, lat, long, name2)


# filter ------------------------------------------------------------------

cameras
filter(cameras, lat > 50.05, long < 14.5)
filter(cameras, lat > 50.05 & long < 14.5)
filter(cameras, lat > 50.05 | long < 14.5, !is.na(externalid))


# arrange -----------------------------------------------------------------

arrange(cameras, name)
arrange(cameras, desc(name))
arrange(cameras, round(lat, 1), long)
arrange(cameras, round(lat, 1), -long)
arrange(cameras, round(lat, 1), desc(long))
