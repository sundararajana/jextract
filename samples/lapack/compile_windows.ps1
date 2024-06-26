param(
  [Parameter(Mandatory=$true, HelpMessage="The path to the lapack installation which include/lapacke.h and dependent headers")]
  [string]$lapackPath
)

jextract `
  --output src `
  -t lapack `
  -I "$lapackPath\include" `
  -l liblapacke `
  '<lapacke.h>'

javac -d classes (ls -r src/*.java)
