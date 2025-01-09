#!/usr/bin/env python
# coding: utf-8

# In[1]:


pip install psycopg2


# In[2]:


import pandas as pd
import psycopg2
from sqlalchemy import create_engine 


# In[3]:


orders_df = pd.read_csv("orders.csv").sample(10000)


# In[4]:


orders_df.head()


# In[6]:


aisles_df = pd.read_csv("aisles.csv")
departments_df = pd.read_csv("departments.csv")
order_products_df = pd.read_csv("order_products.csv")
order_products_sample_df = order_products_df[order_products_df['order_id'].isin(orders_df['order_id'])]
products_df = pd.read_csv("products.csv")


# In[7]:


aisles_df.head()


# In[8]:


order_products_sample_df.head()


# In[9]:


products_df.head()


# In[10]:


departments_df.head()


# In[11]:


# connection
try:
    conn = psycopg2.connect(dbname = 'instakart_analysis', user = 'postgres', password = 'postgres', port = '5432')
except:
    print("connection was unsucessful")


# In[12]:


cur = conn.cursor()


# In[13]:


engine = create_engine('postgresql+psycopg2://postgres:postgres@localhost/instakart_analysis')


# In[14]:


cur.execute("""
CREATE TABLE aisles (
    aisle_id INTEGER PRIMARY KEY,
    aisle VARCHAR(255)
)
""")


# In[15]:


cur.execute("""
    CREATE TABLE departments(
    department_id INT PRIMARY KEY,
    department VARCHAR(255)
    )
""")


# In[16]:


cur.execute("""
    CREATE TABLE products(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    aisle_id INT,
    department_id INT,
    FOREIGN KEY (aisle_id) REFERENCES aisles (aisle_id),
    FOREIGN KEY (department_id) REFERENCES departments (department_id)
    )
""")


# In[17]:


cur.execute("""
    CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    user_id INT ,
    order_number INT,
    order_dow INT ,
    order_hour_of_day INT ,
    days_since_prior_order INT
    )
""")


# In[18]:


cur.execute("""
    CREATE TABLE order_products(
    order_id INT,
    product_id INT,
    add_to_cart_order INT,
    reordered INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
    )
""")


# In[19]:


conn.commit()


# In[20]:


orders_df.drop('eval_set', inplace=True, axis=1)


# In[21]:


aisles_df.to_sql('aisles', con=engine, if_exists='append', index =False)


# In[22]:


departments_df.to_sql('departments', con= engine, if_exists='append', index =False)


# In[23]:


products_df.to_sql('products', con= engine, if_exists = 'append', index =False)


# In[24]:


orders_df.to_sql('orders', con=engine, if_exists= 'append', index=False)


# In[25]:


order_products_sample_df.to_sql('order_products', con=engine, if_exists = 'append', index =False)


# In[ ]:





# In[ ]:




