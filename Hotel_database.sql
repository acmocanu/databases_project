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
('B0001', 3, 5, '135 Carlingview Dr, Toronto, ON M9W5E7, Canada', 'bestwestern_premier_toronto@bestwestern.com', 4166377000, 'Best Western Hotels'),
('B0002', 2, 5, '38 Estate Dr, Toronto, ON M1H2Z1, Canada', 'bestwestern_toronto@bestwestern.com', 4164300444, 'Best Western Hotels'),
('B0003', 3, 5, '50 W 36th St., New York, NY 10018, USA', 'bestwestern_premier_newyork@bestwestern.com', 2127761024, 'Best Western Hotels'),
('B0004', 4, 5, '1100 Granville St, Vancouver, BC V6Z2B6, Canada', 'bestwestern_vancouver@bestwestern.com', 6046697070, 'Best Western Hotels'),
('B0005', 3, 5, '131 Laurier St, Gatineau, QC J8X3W3, Canada', 'bestwestern_gatineau@bestwestern.com', 8197708550, 'Best Western Hotels'),
('B0006', 2, 5, '1100 S Michigan Ave, Chicago, IL 60605, USA', 'bestwestern_chicago@bestwestern.com', 3129222900, 'Best Western Hotels'),
('B0007', 3, 5, '77 Yesler Way, Seattle, WA 98104, USA', 'bestwestern_seattle@bestwestern.com', 2063401234, 'Best Western Hotels'),
('B0008', 3, 5, '1316 33 St NE, Calgary, AB T2A6B6, Canada', 'bestwestern_calgary@bestwestern.com', 4032488888, 'Best Western Hotels'),
('C0001', 3, 5, '616 Convention Way, Anaheim, CA 92802, USA', 'choicehotels_anaheim@choicehotels.com', 7147503131, 'Choice Hotels International'),
('C0002', 3, 5, '117 Elm St, Greater Sudbury, ON P3C1T3, Canada', 'choicehotels_sudbury@choicehotels.com', 7056747517, 'Choice Hotels International'),
('C0003', 2, 5, '7228 Westminster Hwy, Richmond, BC V6X1A1, Canada', 'choicehotels_richmond@choicehotels.com', 6042443051, 'Choice Hotels International'),
('C0004', 3, 5, '1221 Granville St, Richmond, BC V6X1B6, Canada', 'choicehotels_quality_richmond@choicehotels.com', 7789072918, 'Choice Hotels International'),
('C0005', 2, 5, '4770 Plaza Dr, Irving, TX 75063, USA', 'choicehotels_irving@choicehotels.com', 9725739320, 'Choice Hotels International'),
('C0006', 4, 5, '5301 NW 36th St, Miami Springs, FL 33166, USA', 'choicehotels_miami@choicehotels.com', 3059214268, 'Choice Hotels International'),
('C0007', 2, 5, '355 McNeely Ave, Carleton Place, ON K7C0A1, Canada', 'choicehotels_carleton@choicehotels.com', 6132160079, 'Choice Hotels International'),
('C0008', 2, 5, '8100 Av. de Neuville, Anjou, QC H1J2T2, Canada', 'choicehotels_anjou@choicehotels.com', 5144936363, 'Choice Hotels International'),
('H0001', 5, 5, '433 Robson St, Vancouver, BC V6B6L9, Canada', 'hilton_vancouver@hilton.com', 6046021999, 'Hilton Worldwide'),
('H0002', 4, 5, '1335 6th Ave, New York, NY 10019, USA', 'hilton_midtown@hilton.com', 2125867000, 'Hilton Worldwide'),
('H0003', 3, 5, '790 8th Ave, New York, NY 10019, USA', 'hilton_tsquare@hilton.com', 2125817000, 'Hilton Worldwide'),
('H0004', 4, 5, '333 Farrell St, San Francisco, CA 94102, USA', 'hilton_sanfran@hilton.com', 4157711400, 'Hilton Worldwide'),
('H0005', 3, 5, '711 4 St. SE Suite A, Calgary, AB T2G1N3, Canada', 'hilton_calgary@hilton.com', 5873522020, 'Hilton Worldwide'),
('H0006', 4, 5, '1800 Wellington Ave, Winnipeg, MB R3H1B2, Canada', 'hilton_winnipeg@hilton.com', 2047831700, 'Hilton Worldwide'),
('H0007', 4, 5, '145 Richmond St W, Toronto, ON M5H2L2, Canada', 'hilton_toronto@hilton.com', 4168693456, 'Hilton Worldwide'),
('H0008', 4, 5, '1100 Bd René-Lévesque E, Québec, QC G1R4P3, Canada', 'hilton_quebec@hilton.com', 4186472411, 'Hilton Worldwide'),
('M0001', 5, 5, '39 Smithe St, Vancouver, BC V6B0R3, Canada', 'marriott_parq@marriott.com', 6046760888, 'Marriott International'),
('M0002', 4, 5, '1128 W Hastings St, Vancouver, BC V6E4R5, Canada', 'marriott_vancouver@marriott.com', 6046841128, 'Marriott International'),
('M0003', 4, 5, '100 Kent St, Ottawa, ON K1P5R7, Canada', 'marriott_ottawa@marriott.com', 6132381122, 'Marriott International'),
('M0004', 3, 5, '170 4th Ave N, Nashville, TN 37219, USA', 'marriott_nashville@marriott.com', 6152560900, 'Marriott International'),
('M0005', 4, 5, '1331 Pennsylvania Avenue NW, Washington, DC 20004, USA', 'marriott_washington@marriott.com', 2023932000, 'Marriott International'),
('M0006', 3, 5, '530 Broadway, San Diego, CA 92101, USA', 'marriott_sdiego@marriott.com', 6194463000, 'Marriott International'),
('M0007', 4, 5, '1919 Upper Water St, Halifax, NS B3J3J5, Canada', 'marriott_halifax@marriott.com', 9024211700, 'Marriott International'),
('M0008', 5, 5, '1401 SW Naito Pkwy, Portland, OR 97201, USA', 'marriott_portland@marriott.com', 5032267600, 'Marriott International'),
('W0001', 3, 5, '2259 Prince of Wales Dr, Ottawa, ON K2E6Z8, Canada', 'wyndham_rideau@wyndham.com', 6132883500, 'Wyndham Hotels and Resorts'),
('W0002', 2, 5, '366 Hunt Club Rd, Ottawa, ON K1V1C1, Canada', 'wyndham_ottawa@wyndham.com', 6137397555, 'Wyndham Hotels and Resorts'),
('W0003', 4, 5, '300 Jarvis St, Toronto, ON M5B2C5, Canada', 'wyndham_toronto@wyndham.com', 4169774823, 'Wyndham Hotels and Resorts'),
('W0004', 4, 5, '11 Freeport Cres NE, Calgary, AB T3J0T4, Canada', 'wyndham_calgary@wyndham.com', 4035162266, 'Wyndham Hotels and Resorts'),
('W0005', 2, 5, '2810 N 9th St, St. Louis, MO 63147, USA', 'wyndham_louis@wyndham.com', 3144928824, 'Wyndham Hotels and Resorts'),
('W0006', 3, 5, '8001 International Dr, Orlando, FL 32819, USA', 'wyndham_orlando@wyndham.com', 4073512420, 'Wyndham Hotels and Resorts'),
('W0007', 3, 5, '8686 Kirby Dr, Houston, TX 77054, USA', 'wyndham_houston@wyndham.com', 7137483221, 'Wyndham Hotels and Resorts'),
('W0008', 3, 5, '600 Commonwealth Pl, Pittsburgh, PA 15222, USA', 'wyndham_pittsburgh@wyndham.com', 4123914600, 'Wyndham Hotels and Resorts');