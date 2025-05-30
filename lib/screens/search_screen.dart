import 'package:flutter/material.dart';
import 'package:zymo_app/screens/booking_screen.dart';
import 'sign_in_method_screen.dart';

class Car {
  final String name;
  final String image;
  final String seats;
  final String transmission;
  final double price;
  final String brand;

  Car({
    required this.name,
    required this.image,
    required this.seats,
    required this.transmission,
    required this.price,
    required this.brand,
  });
}

class SearchScreen extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;

  const SearchScreen({
    Key? key,
    required this.startDate,
    required this.endDate,
  }) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String selectedTransmission = 'All';
  String selectedSeats = 'All';

  final List<Car> cars = [
    Car(
      name: 'Hyundai Verna',
      image: 'assets/images/c1.jpeg',
      seats: '5',
      transmission: 'Automatic',
      price: 2688.0,
      brand: 'Hyundai',
    ),
    Car(
      name: 'Honda City',
      image: 'assets/images/c2.jpeg',
      seats: '5',
      transmission: 'Manual',
      price: 2899.0,
      brand: 'Honda',
    ),
    Car(
      name: 'Toyota Innova',
      image: 'assets/images/c3.jpeg',
      seats: '7',
      transmission: 'Automatic',
      price: 3499.0,
      brand: 'Toyota',
    ),
    Car(
      name: 'Mahindra XUV700',
      image: 'assets/images/c4.jpeg',
      seats: '7',
      transmission: 'Manual',
      price: 3299.0,
      brand: 'Mahindra',
    ),
    Car(
      name: 'Tata Safari',
      image: 'assets/images/c5.jpeg',
      seats: '7',
      transmission: 'Automatic',
      price: 3199.0,
      brand: 'Tata',
    ),
    Car(
      name: 'Maruti Ertiga',
      image: 'assets/images/c6.jpeg',
      seats: '7',
      transmission: 'Manual',
      price: 2499.0,
      brand: 'Maruti',
    ),
    Car(
      name: 'Kia Carnival',
      image: 'assets/images/c1.jpeg',
      seats: '8',
      transmission: 'Automatic',
      price: 4299.0,
      brand: 'Kia',
    ),
    Car(
      name: 'Hyundai Creta',
      image: 'assets/images/c2.jpeg',
      seats: '5',
      transmission: 'Manual',
      price: 2799.0,
      brand: 'Hyundai',
    ),
    Car(
      name: 'MG Hector',
      image: 'assets/images/c3.jpeg',
      seats: '5',
      transmission: 'Automatic',
      price: 2999.0,
      brand: 'MG',
    ),
    Car(
      name: 'Tata Harrier',
      image: 'assets/images/c4.jpeg',
      seats: '5',
      transmission: 'Manual',
      price: 2899.0,
      brand: 'Tata',
    ),
  ];

  List<Car> get filteredCars {
    return cars.where((car) {
      bool matchesTransmission = selectedTransmission == 'All' || 
                               car.transmission == selectedTransmission;
      bool matchesSeats = selectedSeats == 'All' || 
                         car.seats == selectedSeats;
      return matchesTransmission && matchesSeats;
    }).toList();
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _navigateToSignIn() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignInMethodScreen(
          amount: 2688.0,
          requiredAmount: 2688,
        ),
      ),
    );
  }

  void _showFilterPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Transmission',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildFilterOption(
                        'Manual', selectedTransmission == 'Manual', (val) {
                      setState(() => selectedTransmission = 'Manual');
                      Navigator.pop(context);
                      _showFilterPopup();
                    }),
                    _buildFilterOption(
                        'Automatic', selectedTransmission == 'Automatic',
                        (val) {
                      setState(() => selectedTransmission = 'Automatic');
                      Navigator.pop(context);
                      _showFilterPopup();
                    }),
                    _buildFilterOption('All', selectedTransmission == 'All',
                        (val) {
                      setState(() => selectedTransmission = 'All');
                      Navigator.pop(context);
                      _showFilterPopup();
                    }),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'Seats',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.spaceEvenly,
                  children: [
                    _buildFilterOption('5', selectedSeats == '5', (val) {
                      setState(() => selectedSeats = '5');
                      Navigator.pop(context);
                      _showFilterPopup();
                    }),
                    _buildFilterOption('6', selectedSeats == '6', (val) {
                      setState(() => selectedSeats = '6');
                      Navigator.pop(context);
                      _showFilterPopup();
                    }),
                    _buildFilterOption('7', selectedSeats == '7', (val) {
                      setState(() => selectedSeats = '7');
                      Navigator.pop(context);
                      _showFilterPopup();
                    }),
                    _buildFilterOption('8', selectedSeats == '8', (val) {
                      setState(() => selectedSeats = '8');
                      Navigator.pop(context);
                      _showFilterPopup();
                    }),
                    _buildFilterOption('All', selectedSeats == 'All', (val) {
                      setState(() => selectedSeats = 'All');
                      Navigator.pop(context);
                      _showFilterPopup();
                    }),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Here you can implement the filter logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFFA8D),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Apply',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFilterOption(
      String text, bool isSelected, Function(bool) onSelect) {
    return GestureDetector(
      onTap: () => onSelect(true),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFFA8D) : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.grey[600],
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${_formatDate(widget.startDate)} - ${_formatDate(widget.endDate)}',
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFFFFFA8D),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.black,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Select your desired car',
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      filled: true,
                      fillColor: Color(0xFF393E46),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: _showFilterPopup,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFA8D),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.filter_list,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Updated car listings
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredCars.length,
              itemBuilder: (context, index) {
                final car = filteredCars[index];
                return GestureDetector(
                  onTap: () => _showCarDetailsPopup(context),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFF393E46),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Car image
                        Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              car.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Car details
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Left side - Car name and seats info
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    car.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${car.seats} seats | ${car.transmission}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Right side - Price and Book button
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'Starts at',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '₹${car.price.toStringAsFixed(0)}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  '(GST incl)',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showCarDetailsPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.55,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header row with close button and "Choose from"
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Choose from',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close, size: 24),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Showing 1 option',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'Fulfilled by ',
                                style: TextStyle(fontSize: 12),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                child: const Text(
                                  'Zoomcar',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ...List.generate(
                                  4,
                                  (index) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 16,
                                      )),
                              const Icon(
                                Icons.star_half,
                                color: Colors.amber,
                                size: 16,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // Features list
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildFeatureItem('Self Pickup'),
                              _buildFeatureItem('Manual Transmission'),
                              _buildFeatureItem('Petrol'),
                              _buildFeatureItem('Fuel Not Included'),
                              _buildFeatureItem('Unlimited KMs'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '₹3360',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            '₹2688',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            '(GST incl)',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the popup
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SignInMethodScreen(
                                    amount: 2688.0,
                                    requiredAmount: 2688,
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFFFA8D),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 28,
                                vertical: 8,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Book',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Zero Security Deposit text field
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black),
                  ),
                  child: const Center(
                    child: Text(
                      'Zero Security Deposit*',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 4,
            height: 4,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
