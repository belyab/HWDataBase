WITH RECURSIVE r AS (
	select hotel_id, hotel_chain_id
	from hotel_chain_hotel
	where hotel_chain_id = 1
	
	UNION
	
	select hotel_chain_hotel.hotel_id, hotel_chain_hotel.hotel_chain_id
	from hotel_chain_hotel
	JOIN r
	ON hotel_chain_hotel.hotel_chain_id = r.hotel_chain_id

)
select * from r;