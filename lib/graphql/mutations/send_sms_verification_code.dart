const sendSmsVerificationCode = '''
mutation(\$phone: String!) {
  sendSmsVerificationCode(phone: \$phone) {
    context
    expiredAt
    period
  }
}
''';
