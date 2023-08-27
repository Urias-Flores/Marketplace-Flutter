class Contact{
  final String firstName;
  final String lastName;
  final String phone;
  final String address;

  Contact({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.address
  });

  factory Contact.fromJSON(Map<String, dynamic> data){
    return Contact(
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        phone: data['Phone'] ?? '',
        address: data['Address'] ?? ''
    );
  }

  toJSON(){
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Phone': phone,
      'Address': address
    };
  }
}