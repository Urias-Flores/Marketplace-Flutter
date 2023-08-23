class Contact{
  final String phone;
  final String email;
  final String address;

  Contact({
    required this.phone,
    required this.email,
    required this.address
  });

  factory Contact.fromJSON(Map<String, dynamic> data){
    return Contact(
        phone: data['Phone'] ?? '',
        email: data['Email'] ?? '',
        address: data['Address'] ?? ''
    );
  }

  toJSON(){
    return {
      'Phone': phone,
      'Email': email,
      'Address': address
    };
  }
}