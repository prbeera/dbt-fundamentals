select orderid as order_id
      ,paymentmethod
      ,amount/100 as amount
  from {{ source('stripe', 'payment') }}