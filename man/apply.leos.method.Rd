% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/apply.leos.method.R
\name{apply.leos.method}
\alias{apply.leos.method}
\title{Method to generate estimates based on notification opportunity profile.}
\usage{
apply.leos.method(df.in, current.epiyearweek, quantile.target = 0.95,
  low.activity = NULL, generate.plots = F)
}
\arguments{
\item{df.in}{Data frame with the FIRST THREE columns refering to [,1] location id, [,2] notification date,
[,3] digitization date, unless all(c('ID_MUNICIP', 'DT_NOTIFIC', 'DT_DIGITA') \%in\% names(df.in)) == T}

\item{current.epiyearweek}{Most recent epidemiological week to be considered and estimated.
Expected format YYYY*WW, e.g., 2010W03}

\item{quantile.target}{Quantile to be used to determine Dmax from delay profile. Default: 0.95}

\item{low.activity}{List of location id's not to be estimated due to low activity. Default: NULL}

\item{generate.plots}{Boolean object to determine wether function should generate and save plots or not. Default: F}
}
\value{
Function \code{apply.leos.method} returns a list containing the following components:
\item{estimated.data.frame}{Data frame containing the weekly aggregate of df.in, plus columns with estimate mean,
quantiles 2.5\%, 50\% and 97.5\% and other relevant info}
\item{delay.cutoff}{Data frame with Dmax obtained for each locality, epiyearweek used as cutoff and execution date}
\item{estimated.epiyearweek}{Epidemiological week requested}
\item{model.pars}{List with model's WAIC, DIC and hyperparameters from the INLA, for each locality (as character)}
\item{call}{Function call}
}
\description{
Function \code{apply.leos.method} applies the following method for the estimates:
Notification delay modelling
by Leo Bastos
}
\details{
N_t - number of notified cases at time t

Y_{t,d} - number of notified cases from time t with notification delay d

D - maximum acceptable time delay

N_t = Y_{t,0} + sum_{d=1}^{D} Y_{t,d}

Y_{0,t} is known forall t

If T is today, Y_{t,d} is unknown for all (t,d) such that t+d > T

Contributtors:
Claudia T Codeço and Marcelo F C Gomes
}
\examples{
data(opportunity.example.data)
res <- apply.leos.method(opportunity.example.data, current.epiyearweek='2014W52',
 quantile.target=0.95)

}
\author{
Marcelo F C Gomes \email{marcelo.gomes@fiocruz.br}
}
