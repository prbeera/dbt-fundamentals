with payments as (

    select * from {{ ref('stg_payments')}}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

customers as (

    select * from {{ ref('stg_customers') }}

),

order_payments as (
    select *
      from orders
      join payments using (order_id)
),

customer_payments as (
    select customer_id 
          ,order_id
          ,amount
      from order_payments
       join customers using (customer_id)
       order by customer_id
)

select * 
  from customer_payments