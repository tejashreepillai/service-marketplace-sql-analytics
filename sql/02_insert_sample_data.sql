-- Fictional sample data for the ProApp service marketplace.
-- Names, contact details and transactions are entirely synthetic.

INSERT ALL
    INTO CUSTOMER VALUES
        (1, 'Alice Johnson', '0400000001', 'alice.johnson@example.com',
         'Sydney NSW', 'Premium')
    INTO CUSTOMER VALUES
        (2, 'Bob Smith', '0400000002', 'bob.smith@example.com',
         'Sydney NSW', 'Basic')
    INTO CUSTOMER VALUES
        (3, 'Emma Davis', '0400000003', 'emma.davis@example.com',
         'Melbourne VIC', 'Premium')
    INTO CUSTOMER VALUES
        (4, 'Liam Harris', '0400000004', 'liam.harris@example.com',
         'Sydney NSW', 'Basic')
    INTO CUSTOMER VALUES
        (5, 'Olivia Johnson', '0400000005', 'olivia.johnson@example.com',
         'Melbourne VIC', 'Premium')
    INTO CUSTOMER VALUES
        (6, 'James Carter', '0400000006', 'james.carter@example.com',
         'Brisbane QLD', 'Basic')
    INTO CUSTOMER VALUES
        (7, 'Sophia Turner', '0400000007', 'sophia.turner@example.com',
         'Perth WA', 'Premium')
    INTO CUSTOMER VALUES
        (8, 'Noah Williams', '0400000008', 'noah.williams@example.com',
         'Adelaide SA', 'Basic')
SELECT 1 FROM DUAL;

INSERT ALL
    INTO TRADESPERSON VALUES
        (1, 'Charlie Brown', '0410000001', 'charlie.brown@example.com',
         'Sydney NSW', 'Electrician, Plumber', 'Expert')
    INTO TRADESPERSON VALUES
        (2, 'Diana Lee', '0410000002', 'diana.lee@example.com',
         'Sydney NSW', 'Gardener, Handyman', 'Intermediate')
    INTO TRADESPERSON VALUES
        (3, 'John Wilson', '0410000003', 'john.wilson@example.com',
         'Melbourne VIC', 'Handyman, Electrician', 'Expert')
    INTO TRADESPERSON VALUES
        (4, 'Bruce Taylor', '0410000004', 'bruce.taylor@example.com',
         'Sydney NSW', 'Carpenter, Painter', 'Intermediate')
    INTO TRADESPERSON VALUES
        (5, 'Clark Martin', '0410000005', 'clark.martin@example.com',
         'Melbourne VIC', 'Plumber', 'Master')
    INTO TRADESPERSON VALUES
        (6, 'Tony Evans', '0410000006', 'tony.evans@example.com',
         'Brisbane QLD', 'Electrician, Engineer', 'Expert')
    INTO TRADESPERSON VALUES
        (7, 'Maya Patel', '0410000007', 'maya.patel@example.com',
         'Perth WA', 'Gardener, Builder', 'Intermediate')
    INTO TRADESPERSON VALUES
        (8, 'Ethan Hall', '0410000008', 'ethan.hall@example.com',
         'Adelaide SA', 'Painter', 'Beginner')
SELECT 1 FROM DUAL;

INSERT ALL
    INTO TASK VALUES
        (1, 1, 'Fix Leaky Faucet', 50000, 'Completed',
         TO_DATE('2024-01-15', 'YYYY-MM-DD'))
    INTO TASK VALUES
        (2, 2, 'Garden Cleanup', 100000, 'Completed',
         TO_DATE('2024-01-20', 'YYYY-MM-DD'))
    INTO TASK VALUES
        (3, 3, 'Install Light Fixture', 80000, 'Completed',
         TO_DATE('2024-09-01', 'YYYY-MM-DD'))
    INTO TASK VALUES
        (4, 4, 'Repair Wooden Deck', 150000, 'Completed',
         TO_DATE('2024-10-15', 'YYYY-MM-DD'))
    INTO TASK VALUES
        (5, 5, 'Unclog Kitchen Sink', 60000, 'Completed',
         TO_DATE('2024-09-30', 'YYYY-MM-DD'))
    INTO TASK VALUES
        (6, 6, 'Assemble Furniture', 45000, 'Completed',
         TO_DATE('2024-09-25', 'YYYY-MM-DD'))
    INTO TASK VALUES
        (7, 7, 'Garden Landscaping', 200000, 'Completed',
         TO_DATE('2024-02-10', 'YYYY-MM-DD'))
SELECT 1 FROM DUAL;

INSERT ALL
    INTO BID VALUES
        (1, 1, 1, 45000, TO_DATE('2024-01-16', 'YYYY-MM-DD'))
    INTO BID VALUES
        (2, 2, 2, 95000, TO_DATE('2024-01-21', 'YYYY-MM-DD'))
    INTO BID VALUES
        (3, 3, 3, 75000, TO_DATE('2024-09-02', 'YYYY-MM-DD'))
    INTO BID VALUES
        (4, 4, 4, 140000, TO_DATE('2024-10-16', 'YYYY-MM-DD'))
    INTO BID VALUES
        (5, 5, 5, 58000, TO_DATE('2024-10-01', 'YYYY-MM-DD'))
    INTO BID VALUES
        (6, 6, 6, 40000, TO_DATE('2024-09-26', 'YYYY-MM-DD'))
    INTO BID VALUES
        (7, 7, 7, 190000, TO_DATE('2024-02-11', 'YYYY-MM-DD'))
SELECT 1 FROM DUAL;

INSERT ALL
    INTO PAYMENT_TRANSACTION VALUES
        (1, 1, 1, 45000, 'Credit Card',
         TO_DATE('2024-01-17', 'YYYY-MM-DD'))
    INTO PAYMENT_TRANSACTION VALUES
        (2, 2, 2, 95000, 'e-Wallet',
         TO_DATE('2024-01-22', 'YYYY-MM-DD'))
    INTO PAYMENT_TRANSACTION VALUES
        (3, 3, 3, 75000, 'Credit Card',
         TO_DATE('2024-09-03', 'YYYY-MM-DD'))
    INTO PAYMENT_TRANSACTION VALUES
        (4, 4, 4, 140000, 'e-Wallet',
         TO_DATE('2024-10-20', 'YYYY-MM-DD'))
    INTO PAYMENT_TRANSACTION VALUES
        (5, 5, 5, 58000, 'Credit Card',
         TO_DATE('2024-10-05', 'YYYY-MM-DD'))
    INTO PAYMENT_TRANSACTION VALUES
        (6, 6, 6, 40000, 'e-Wallet',
         TO_DATE('2024-09-29', 'YYYY-MM-DD'))
    INTO PAYMENT_TRANSACTION VALUES
        (7, 7, 7, 190000, 'e-Wallet',
         TO_DATE('2024-02-15', 'YYYY-MM-DD'))
SELECT 1 FROM DUAL;

INSERT ALL
    INTO RATING VALUES
        (1, 1, 1, 1, 5.0, 'Completed quickly and efficiently.')
    INTO RATING VALUES
        (2, 2, 2, 2, 3.0, 'Good work, but the arrival was late.')
    INTO RATING VALUES
        (3, 3, 3, 3, 5.0, 'Excellent light-fixture installation.')
    INTO RATING VALUES
        (4, 4, 4, 4, 3.5, 'The deck repair was completed successfully.')
    INTO RATING VALUES
        (5, 5, 5, 5, 4.5, 'The kitchen sink issue was resolved well.')
    INTO RATING VALUES
        (6, 6, 6, 6, 4.0, 'Furniture assembly was completed as requested.')
    INTO RATING VALUES
        (7, 7, 7, 7, 4.5, 'The landscaping work met expectations.')
SELECT 1 FROM DUAL;

COMMIT;
