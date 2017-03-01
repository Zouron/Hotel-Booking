SELECT customers.gname AS 'First Name', 
		customers.sname AS 'Last Name', 
		bookings.rid AS 'Room ID', 
		bookings.checkin AS 'Check-In', 
		bookings.checkout AS 'Check-Out', 
		bookings.cost AS 'Total Cost', 
		bookings.btime AS 'Booking Time'
FROM bookings
INNER JOIN customers ON customers.username=bookings.username
WHERE customers.username = 'bwayne@gmail.com'