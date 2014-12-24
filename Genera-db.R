library(foreign)
library(dplyr)
library(ggplot2)
library(survey)
library(KernSmooth)
library(np)
library(laeken)
library(tidyr)
library(gam)


gastos<-tbl_df(read.dta("C:/Users/VictorF/Documents/ENGH 2012/Cleaned/Gastos.dta",
                         convert.factors=TRUE))
gastos<-filter(gastos, monto>=0)

by_hog<-group_by(gastos,clave, division)
total<-summarize(by_hog, sum(monto, na.rm=TRUE))
names(total)<-c("clave", "division", "monto")
total$division<-factor(total$division)
total$clave<-factor(total$clave)

alim<-filter(total, division=="Alimentos y bebidas")
indu<-filter(total, division=="Indumentaria y calzado")
vivi<-filter(total, division=="Vivienda")
equip<-filter(total, division=="Equipamiento y funcionamiento del hogar")
medi<-filter(total, division=="Atención médica y gastos para la salud")
trans<-filter(total, division=="Transporte y comunicaciones")
cult<-filter(total, division=="Esparcimiento y cultura")
educ<-filter(total, division=="Educación")
vars<-filter(total, division=="Bienes y servicios varios")

merge1<-merge(alim, indu, by="clave", all=TRUE)
merge1<-merge1[,-c(2,4)]
names(merge1)<-c("clave", "Alimentos y bebidas", "Indumentaria y calzado")
merge2<-merge(merge1, vivi, by="clave", all=TRUE)
rm(merge1)
merge2<-merge2[,-4]
names(merge2)<-c("clave", "Alimentos y bebidas", "Indumentaria y calzado",
                 "Vivienda")
merge3<-merge(merge2, equip, by="clave", all=TRUE)
rm(merge2)
merge3<-merge3[,-5]
names(merge3)<-c("clave", "Alimentos y bebidas", "Indumentaria y calzado",
                 "Vivienda", "Equipamiento y funcionamiento del hogar")
merge4<-merge(merge3, medi, by="clave", all=TRUE)
rm(merge3)
merge4<-merge4[,-6]
names(merge4)<-c("clave", "Alimentos y bebidas", "Indumentaria y calzado",
                 "Vivienda", "Equipamiento y funcionamiento del hogar",
                 "Atención médica y gastos para la salud")
merge5<-merge(merge4, trans, by="clave", all=TRUE)
rm(merge4)
merge5<-merge5[,-7]
names(merge5)<-c("clave", "Alimentos y bebidas", "Indumentaria y calzado",
                 "Vivienda", "Equipamiento y funcionamiento del hogar",
                 "Atención médica y gastos para la salud", "Transporte y comunicaciones")               )
merge6<-merge(merge5, cult, by="clave", all=TRUE)
rm(merge5)
merge6<-merge6[,-8]
names(merge6)<-c("clave", "Alimentos y bebidas", "Indumentaria y calzado",
                 "Vivienda", "Equipamiento y funcionamiento del hogar",
                 "Atención médica y gastos para la salud", "Transporte y comunicaciones",
                 "Cultura y esparcimiento")
merge7<-merge(merge6, educ, by="clave", all=TRUE)
rm(merge6)
merge7<-merge7[,-9]
names(merge7)<-c("clave", "Alimentos y bebidas", "Indumentaria y calzado",
                 "Vivienda", "Equipamiento y funcionamiento del hogar",
                 "Atención médica y gastos para la salud", "Transporte y comunicaciones",
                 "Cultura y esparcimiento", "Educación")
merge8<-merge(merge7, vars, by="clave", all=TRUE)
rm(merge7)
merge8<-merge8[,-10]
names(merge8)<-c("clave", "Alimentos y bebidas", "Indumentaria y calzado",
                 "Vivienda", "Equipamiento y funcionamiento del hogar",
                 "Atención médica y gastos para la salud", "Transporte y comunicaciones",
                 "Cultura y esparcimiento", "Educación", "Bienes y servicios varios")
rm(alim, cult,educ,equip,indu,medi,trans,vars,vivi)

gt_hog<-merge8
rm(merge8)
Total<-rowSums(gt_hog[,-1], na.rm=TRUE, dims=1)
gt_hog<-cbind(gt_hog, Total)

save(gt_hog, file="C:/Users/VictorF/Documents/ENGH 2012/Cleaned/gt_hog.Rdata")
rm(list=ls())


gxh<-tbl_df(merge(hogares, gastos, by="clave"))
rm(gastos, hogares)

by_division<-group_by(gxh, division, tipohog)
sum1<-summarise(by_division, mean(monto, na.rm=TRUE), median(monto, na.rm=TRUE))
by_prov<-group_by(gxh, provincia.x)
sum2<-summarize(by_prov, mean(ingtoth, na.rm=TRUE), mean(monto, na.rm=TRUE))
names(sum2)<-c("provincia", "ingtoth", "monto")

ingtoth1<-sum2$ingtoth/100

plot(ingtoth1, sum2$monto, type="p", col="darkgray", pch=19)
reg<-lm(monto~ingtoth1, data=sum2)
abline(reg, col="red")

tapply(gxh$monto, list(gxh$division,gxh$tipohog), FUN=weightedMean, gxh$expan, na.rm=TRUE)
tapply(gxh$monto, gxh$provincia.x, FUN=weightedMean, gxh$expan, na.rm=TRUE)
tapply(gxh$ingtoth, gxh$provincia.x, FUN=weightedMean, gxh$expan, na.rm=TRUE)
tapply(gxh$monto, gxh$provincia.x, FUN=weightedQuantile, gxh$expan, na.rm=TRUE,
       probs=seq(0,1, 0.1))
