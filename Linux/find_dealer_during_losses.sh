#!/bin bash

touch Dealers_working_during_losses_Check

echo '03/10' >> Dealers_working_during_losses_Check
grep -i '05:00:00 AM' 0310_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses_Check
echo 'record added'

grep -i '08:00:00 AM' 0310_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses_Check
echo 'record added'

grep -i '02:00:00 PM' 0310_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses_Check
echo 'record added'

grep -i '08:00:00 PM' 0310_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses_Check
echo 'record added'

grep -i '11:00:00 PM' 0310_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses_Check
echo 'record added'


echo '03/12' >> Dealers_working_during_losses_Check
grep -i '05:00:00 AM' 0312_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses_Check
echo 'record added'

grep -i '08:00:00 AM' 0312_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses_Check
echo 'record added'

grep -i '02:00:00 PM' 0312_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses_Check
echo 'record added'

grep -i '08:00:00 PM' 0312_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses_Check
echo 'record added'

grep -i '11:00:00 PM' 0312_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses_Check
echo 'record added'

echo '03/15' >> Dealers_working_during_losses_Check
grep -i '05:00:00 AM' 0315_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses_Check
echo 'record added'

grep -i '08:00:00 AM' 0315_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses_Check
echo 'record added'

grep -i '02:00:00 PM' 0315_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses_Check
echo 'record added'

echo 'done'
