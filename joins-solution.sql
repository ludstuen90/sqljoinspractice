--
-- Name: addr_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE addr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


SET default_with_oids = false;

--
-- Name: addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE addresses (
    id integer DEFAULT nextval('addr_id_seq'::regclass) NOT NULL,
    street character varying(255),
    city character varying(60),
    state character varying(2),
    zip character varying(12),
    address_type character varying(8),
    customer_id integer
);


--
-- Name: id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE customers (
    id integer DEFAULT nextval('id_seq'::regclass) NOT NULL,
    first_name character varying(60),
    last_name character varying(80)
);


--
-- Name: inv_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE inv_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: line_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE line_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: line_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE line_items (
    id integer DEFAULT nextval('line_id_seq'::regclass) NOT NULL,
    unit_price numeric(3,2),
    quantity integer,
    order_id integer,
    product_id integer
);


--
-- Name: ord_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ord_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE orders (
    id integer DEFAULT nextval('ord_id_seq'::regclass) NOT NULL,
    order_date date,
    total numeric(4,2),
    address_id integer
);


--
-- Name: prod_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE prod_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE products (
    id integer DEFAULT nextval('prod_id_seq'::regclass) NOT NULL,
    description character varying(255),
    unit_price numeric(3,2)
);


--
-- Name: warehouse; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE warehouse (
    id integer DEFAULT nextval('inv_id_seq'::regclass) NOT NULL,
    warehouse character varying(55),
    fulfillment_days integer
);


--
-- Name: warehouse_product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE warehouse_product (
    product_id integer NOT NULL,
    warehouse_id integer NOT NULL,
    on_hand integer
);


--
-- Name: addr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('addr_id_seq', 6, true);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO addresses VALUES (1, '1 Main St', 'Detroit', 'MI', '31111', 'home', 1);
INSERT INTO addresses VALUES (2, '555 Some Pl', 'Chicago', 'IL', '60611', 'business', 1);
INSERT INTO addresses VALUES (3, '8900 Linova Ave', 'Minneapolis', 'MN', '55444', 'home', 2);
INSERT INTO addresses VALUES (4, 'PO Box 999', 'Minneapolis', 'MN', '55334', 'business', 3);
INSERT INTO addresses VALUES (5, '3 Charles Dr', 'Los Angeles', 'CA', '00000', 'home', 4);
INSERT INTO addresses VALUES (6, '934 Superstar Ave', 'Portland', 'OR', '99999', 'business', 4);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO customers VALUES (1, 'Lisa', 'Bonet');
INSERT INTO customers VALUES (2, 'Charles', 'Darwin');
INSERT INTO customers VALUES (3, 'George', 'Foreman');
INSERT INTO customers VALUES (4, 'Lucy', 'Liu');


--
-- Name: id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('id_seq', 4, true);


--
-- Name: inv_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('inv_id_seq', 5, true);


--
-- Name: line_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('line_id_seq', 7, true);


--
-- Data for Name: line_items; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO line_items VALUES (1, 5.00, 16, 1, 1);
INSERT INTO line_items VALUES (2, 3.12, 4, 1, 2);
INSERT INTO line_items VALUES (3, 4.00, 2, 2, 3);
INSERT INTO line_items VALUES (4, 7.25, 3, 4, 4);
INSERT INTO line_items VALUES (5, 6.00, 1, 5, 7);
INSERT INTO line_items VALUES (6, 2.34, 6, 6, 5);
INSERT INTO line_items VALUES (7, 1.05, 9, 7, 5);


--
-- Name: ord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('ord_id_seq', 7, true);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO orders VALUES (1, '2010-03-05', 88.00, 1);
INSERT INTO orders VALUES (2, '2012-02-08', 23.50, 2);
INSERT INTO orders VALUES (3, '2016-02-07', 4.09, 2);
INSERT INTO orders VALUES (4, '2011-03-04', 4.00, 3);
INSERT INTO orders VALUES (5, '2012-09-22', 12.99, 5);
INSERT INTO orders VALUES (6, '2012-09-23', 23.00, 6);
INSERT INTO orders VALUES (7, '2013-05-25', 39.12, 5);


--
-- Name: prod_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('prod_id_seq', 7, true);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO products VALUES (1, 'toothbrush', 3.00);
INSERT INTO products VALUES (2, 'nail polish - blue', 4.25);
INSERT INTO products VALUES (3, 'generic beer can', 2.50);
INSERT INTO products VALUES (4, 'lysol', 6.00);
INSERT INTO products VALUES (5, 'cheetos', 0.99);
INSERT INTO products VALUES (6, 'diet pepsi', 1.20);
INSERT INTO products VALUES (7, 'wet ones baby wipes', 8.99);


--
-- Data for Name: warehouse; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO warehouse VALUES (1, 'alpha', 2);
INSERT INTO warehouse VALUES (2, 'beta', 3);
INSERT INTO warehouse VALUES (3, 'delta', 4);
INSERT INTO warehouse VALUES (4, 'gamma', 4);
INSERT INTO warehouse VALUES (5, 'epsilon', 5);


--
-- Data for Name: warehouse_product; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO warehouse_product VALUES (1, 3, 0);
INSERT INTO warehouse_product VALUES (1, 1, 5);
INSERT INTO warehouse_product VALUES (2, 4, 20);
INSERT INTO warehouse_product VALUES (3, 5, 3);
INSERT INTO warehouse_product VALUES (4, 2, 9);
INSERT INTO warehouse_product VALUES (4, 3, 12);
INSERT INTO warehouse_product VALUES (5, 3, 7);
INSERT INTO warehouse_product VALUES (6, 1, 1);
INSERT INTO warehouse_product VALUES (7, 2, 4);
INSERT INTO warehouse_product VALUES (6, 3, 88);
INSERT INTO warehouse_product VALUES (6, 4, 3);


--
-- Name: addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY warehouse
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (id);


--
-- Name: line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY line_items
    ADD CONSTRAINT line_items_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: products_inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY warehouse_product
    ADD CONSTRAINT products_inventory_pkey PRIMARY KEY (product_id, warehouse_id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: addresses_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers(id);


--
-- Name: line_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY line_items
    ADD CONSTRAINT line_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES orders(id);


--
-- Name: line_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY line_items
    ADD CONSTRAINT line_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: orders_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_address_id_fkey FOREIGN KEY (address_id) REFERENCES addresses(id);


--
-- Name: products_inventory_inventory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY warehouse_product
    ADD CONSTRAINT products_inventory_inventory_id_fkey FOREIGN KEY (warehouse_id) REFERENCES warehouse(id);


--
-- Name: products_inventory_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY warehouse_product
    ADD CONSTRAINT products_inventory_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(id);


--1. Select all customers and their addresses
SELECT * FROM customers, addresses;

--2. Get all orders and their line items.

SELECT * FROM orders, line_items;
--3. Which warehouses have cheetos?
SELECT warehouse_id  AS cheetos_warehouses FROM warehouse_product WHERE product_id=5;


--4. Which warehouses have diet pepsi?

SELECT warehouse_id  AS diet_pepsi_warehouses FROM warehouse_product WHERE product_id=6;

--5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customers.last_name, COUNT(orders.id)
AS NumberOfOrders
FROM addresses
INNER JOIN orders
ON orders.address_id = addresses.id
LEFT JOIN customers
ON addresses.customer_id=customers.id
GROUP BY customers.last_name;


--6. How many customers do we have?
SELECT COUNT(DISTINCT id)FROM customers;

--7. How many products do we carry?
SELECT COUNT(DISTINCT id)FROM products;

--8. What is the total available on-hand quantity of diet pepsi?

SELECT SUM(on_Hand) AS total_diet_pepsi_available FROM warehouse_product WHERE product_id=6;
