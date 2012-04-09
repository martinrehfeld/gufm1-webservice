# Four centuries of geomagnetic secular variation from historical records

This FORTRAN-backed webservice provides an interface to the 'gufm1' model as
published by Andrew Jackson, Art R. T. Jonkers and Matthew R. Walker. From the
abstract of their paper:

> We present a new model of the magnetic field at the core-mantle boundary for
> the interval 1590-1990. The model, called _gufm1_, is based on a massive new
> compilation of historical observations of the magnetic field. The greater part
> of the new dataset originates from unpublished observations taken by mariners
> engaged in merchant and naval shipping.
>
> [...]
>
> For the period before 1800, more than 83000 individual observations of
> magnetic declination were recorded at more than 64000 locations; more than 8000
> new observations are for the 17th century alone. The time-dependent field model
> that we construct from the dataset is parametrized spatially in terms of
> spherical harmonics and temporally in B-splines, using a total of 36512
> parameters.

This webservice can be deployed to Heroku using the
[Fortran buildpack](https://github.com/martinrehfeld/heroku-buildpack-f77).
