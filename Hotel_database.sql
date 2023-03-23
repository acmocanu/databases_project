CREATE TABLE IF NOT EXISTS hotelchain(
Chain_Name VARCHAR(40) PRIMARY KEY,
Address_Central VARCHAR(40) NOT NULL,
Num_Hotels INT NOT NULL,
email varchar(40) NOT NULL,
Phone_Number INT NOT NULL);

CREATE TABLE IF NOT EXISTS hotel(
Hotel_ID VARCHAR(5) PRIMARY KEY,
Stars INT,
Num_Rooms INT NOT NULL,
Address VARCHAR(40) NOT NULL,
email varchar(40) NOT NULL,
Phone_Number INT NOT NULL,
Chain_Name VARCHAR(40) NOT NULL,
FOREIGN KEY (Chain_Name) REFERENCES hotelchain(Chain_Name)); 

CREATE TABLE IF NOT EXISTS employee(
Employee_ID VARCHAR(5) PRIMARY KEY,
SIN VARCHAR(9) NOT NULL,
Employee_Name VARCHAR(40) NOT NULL,
Address VARCHAR(40) NOT NULL,
Position VARCHAR(40) NOT NULL,
Manages_Hotel BOOLEAN,
Hotel_ID VARCHAR(5) NOT NULL,
FOREIGN KEY (Hotel_ID) REFERENCES hotel(Hotel_ID));

CREATE TABLE IF NOT EXISTS Room(
Room_ID VARCHAR(5) PRIMARY KEY,
Price INT NOT NULL,
Amenity VARCHAR(100),
Capacity INT NOT NULL,
Room_View VARCHAR(20),
Extra_Bed BOOLEAN,
Damage VARCHAR(100),
Hotel_ID VARCHAR(5) NOT NULL,
FOREIGN KEY (Hotel_ID)
REFERENCES hotel(Hotel_ID));

CREATE TABLE booking(
Booking_ID VARCHAR(5) PRIMARY KEY,
Check_In DATE NOT NULL,
Check_Out DATE NOT NULL,
Amount INT NOT NULL);

CREATE TABLE renting(
Renting_ID VARCHAR(5) PRIMARY KEY,
Check_In DATE NOT NULL,
Check_Out DATE NOT NULL,
Payment INT NOT NULL);

CREATE TABLE archive(
Record_ID VARCHAR(5) PRIMARY KEY,
Booking VARCHAR(100),
Renting VARCHAR(100));

-------------------------------------------------
INSERT INTO hotelchain
VALUES
('Best Western Hotels', '100 Main St, Phoenix, AZ 85001, USA', 8, 'bestwestern_central@bestwestern.com', 6023339977),
('Choice Hotels International', '980 Clarence St, Rockville, MD 20847, USA', 8, 'choicehotels_central@choicehotels.com', 2407779988),
('Hilton Worldwide', '222 Central Blvd, Tysons Corner, VA 22043, USA', 8, 'hilton_central@hilton.com', 7037779211),
('Marriott International', '500 Wisconsin Ave, Bethesda, MD 20814, USA', 8, 'marriott_central@marriott.com', 2401119211),
('Wyndham Hotels and Resorts', '444 Main St, Parsippany-Troy Hills, NJ 07005, USA', 8, 'wyndham_central@wyndham.com', 9738882134);

INSERT INTO hotel
VALUES
(00001, 3, 5, '135 Carlingview Dr, Toronto, ON M9W5E7, Canada', 'bestwestern_premier_toronto@bestwestern.com', 4166377000, 'Best Western Hotels'),
(00002, 2, 5, '38 Estate Dr, Toronto, ON M1H2Z1, Canada', 'bestwestern_toronto@bestwestern.com', 4164300444, 'Best Western Hotels'),
(00003, 3, 5, '50 W 36th St., New York, NY 10018, USA', 'bestwestern_premier_newyork@bestwestern.com', 2127761024, 'Best Western Hotels'),
(00004, 4, 5, '1100 Granville St, Vancouver, BC V6Z2B6, Canada', 'bestwestern_vancouver@bestwestern.com', 6046697070, 'Best Western Hotels'),
(00005, 3, 5, '131 Laurier St, Gatineau, QC J8X3W3, Canada', 'bestwestern_gatineau@bestwestern.com', 8197708550, 'Best Western Hotels'),
(00006, 2, 5, '1100 S Michigan Ave, Chicago, IL 60605, USA', 'bestwestern_chicago@bestwestern.com', 3129222900, 'Best Western Hotels'),
(00007, 3, 5, '77 Yesler Way, Seattle, WA 98104, USA', 'bestwestern_seattle@bestwestern.com', 2063401234, 'Best Western Hotels'),
(00008, 3, 5, '1316 33 St NE, Calgary, AB T2A6B6,Canada', 'bestwestern_calgary@bestwestern.com',4032488888, 'Best Western Hotels'),
()