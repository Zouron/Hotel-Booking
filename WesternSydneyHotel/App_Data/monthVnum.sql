﻿SELECT MONTH(checkin) AS Month, COUNT(*) AS Number FROM bookings GROUP BY MONTH(checkin);