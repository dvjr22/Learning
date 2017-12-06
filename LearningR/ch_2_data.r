#Getting Data

#Set data to variables
a = 59
b = 55
c = 53.5
d = 55
e = 52.5

Wing1 = a
Wing2 = b
Wing3 = c
Wing4 = d
Wing5 = e

#Math with variables
sqrt(Wing1)
2 * Wing1
Wing1 + Wing2
Wing1 + Wing2 + Wing3 + Wing4 + Wing5
(Wing1 + Wing2 + Wing3 + Wing4 + Wing5)/5

SQ.wing1 = sqrt(Wing1)
mul.w1 = 2 * Wing1
Sum.12 = Wing1 + Wing2
SUM12345 = Wing1 + Wing2 + Wing3 + Wing4 + Wing5
Av = (Wing1 + Wing2 + Wing3 + Wing4 + Wing5)/5

#Brackets to show value
(SQ.wing2 = sqrt(Wing2))

#Concatenate values with c() to create a vector of data
Wingcrd = c(a, b, c, d, e, 57.5, 53, 55)
Wingcrd
#Access data just like array
#Index start at 1
Wingcrd[1]
#Select a range
Wingcrd[1 : 5]
#Exclude nth value
Wingcrd[-2]
#Exclude range
Wingcrd[-2 : -5]

#Addition and assignment of new values
sum(Wingcrd)
s.win = sum(Wingcrd)
s.exclude = sum(Wingcrd[-2: -6])
s.win
s.exclude

#Test data
Tarsus <- c(22.3, 19.7, 20.8, 20.3, 20.8, 21.5, 20.6, 21.5)
Head <- c(31.2, 30.4, 30.6, 30.3, 30.3, 30.8, 32.5, NA)
Wt <- c(9.5, 13.8, 14.8, 15.2, 15.5, 15.6, 15.6, 15.7)