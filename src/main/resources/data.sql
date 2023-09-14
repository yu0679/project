delete member where MEM_WITHDRAWALDATE + (interval '15' minute ) <= sysdate;
commit;