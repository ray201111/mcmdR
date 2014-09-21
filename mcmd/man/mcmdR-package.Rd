\name{mcmdR-package}
\alias{mcmdR-package}
\alias{mcmdR}
\docType{package}
\title{
Use MCMD and get result or output result into file.
}
\description{

Firstly, set MCMD path by using mcmd.set_mcmd_path().
Then, use mcmd.exec_command() to get a result of MCMD.
A point to notice is that argument [string_command] should be written one line.(Should not include a line break)
If you want to create argument [string_command] by some lines, use vector and break line between vector elements.

The detailed explanation of MCMD is in this site.
http://www.nysol.jp/
}
\details{
\tabular{ll}{
Package: \tab mcmdR\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2014-09-14\cr
License: \tab BSD\cr
Run: \tab Linux\cr
}

}
\author{
Takafumi Sasao
}
\references{
}
~~ Optionally other standard keywords, one per line, from file KEYWORDS in the R documentation directory ~~
\keyword{ package }
\seealso{
}
\examples{
# mcmd.set_mcmd_path("/usr/tool/mcmd/bin/")
# res <- mcmd.exec_command(c("cat /fio/home/test_user/csv/test.csv |"
#                          ,"msortf f=pf_id%r"))
# head(res)
}
