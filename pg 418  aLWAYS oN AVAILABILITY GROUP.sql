use master
go
alter availability group [SBSAGroup]
modify replica on
N'LAPTOP-JUGCR8PQ\HAT' WITH 
(SECONDARY_ROLE ( READ_ONLY_ROUTING_URL = N'TCP://LAPTOP-JUGCR8PQ.TRAINING.COM:1433'));
 
  

use master
go
alter availability group [SBSAGroup]
modify replica on
N'LAPTOP-JUGCR8PQ\HAT' WITH 
(PRIMARY_ROLE ( READ_ONLY_ROUTING_LIST = ('LAPTOP-JUGCR8PQ\HAT')))