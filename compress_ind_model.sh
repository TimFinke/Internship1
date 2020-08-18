# Order: ASC1, ASC2, END, exCA1, exCA3, exDG, exPFC1, exPFC2, GABA1, GABA2, MG, NSC, ODC1, OPC, Unclassified

head -1 ./CTS_analyses/Results/$1/$1_ASC1.results > ./CTS_analyses/Results/$1/$1_univariate_model.txt
tail -1 ./CTS_analyses/Results/$1/$1_ASC1.results >> ./CTS_analyses/Results/$1/$1_univariate_model.txt
tail -1 ./CTS_analyses/Results/$1/$1_ASC2.results >>  ./CTS_analyses/Results/$1/$1_univariate_model.txt
tail -1 ./CTS_analyses/Results/$1/$1_END.results >> ./CTS_analyses/Results/$1/$1_univariate_model.txt
tail -1 ./CTS_analyses/Results/$1/$1_exCA1.results >> ./CTS_analyses/Results/$1/$1_univariate_model.txt
tail -1 ./CTS_analyses/Results/$1/$1_exCA3.results >> ./CTS_analyses/Results/$1/$1_univariate_model.txt
tail -1 ./CTS_analyses/Results/$1/$1_exDG.results >> ./CTS_analyses/Results/$1/$1_univariate_model.txt
tail -1 ./CTS_analyses/Results/$1/$1_exPFC1.results >> ./CTS_analyses/Results/$1/$1_univariate_model.txt
tail -1 ./CTS_analyses/Results/$1/$1_exPFC2.results >> ./CTS_analyses/Results/$1/$1_univariate_model.txt
tail -1 ./CTS_analyses/Results/$1/$1_GABA1.results >> ./CTS_analyses/Results/$1/$1_univariate_model.txt
tail -1 ./CTS_analyses/Results/$1/$1_GABA2.results >> ./CTS_analyses/Results/$1/$1_univariate_model.txt
tail -1 ./CTS_analyses/Results/$1/$1_MG.results >> ./CTS_analyses/Results/$1/$1_univariate_model.txt
tail -1 ./CTS_analyses/Results/$1/$1_NSC.results >> ./CTS_analyses/Results/$1/$1_univariate_model.txt
tail -1 ./CTS_analyses/Results/$1/$1_ODC1.results >> ./CTS_analyses/Results/$1/$1_univariate_model.txt
tail -1 ./CTS_analyses/Results/$1/$1_OPC.results >> ./CTS_analyses/Results/$1/$1_univariate_model.txt
tail -1 ./CTS_analyses/Results/$1/$1_Unclassified.results >> ./CTS_analyses/Results/$1/$1_univariate_model.txt


