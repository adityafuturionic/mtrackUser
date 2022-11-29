// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);
import 'dart:convert';

// UserModel userModelFromMap(dynamic str) => UserModel.fromMap(json.decode(str));

// dynamic userModelToMap(UserModel data) => json.encode(data.toMap());

// class UserModel {
//   UserModel({
//     this.userData,
//     this.token,
//   });

//   UserData? userData;
//   dynamic? token;

//   factory UserModel.fromMap(Map<dynamic, dynamic> json) => UserModel(
//         userData: UserData.fromMap(json["userData"]),
//         token: json["token"],
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "userData": userData?.toMap(),
//         "token": token,
//       };
// }

// class UserData {
//   UserData({
//     required this.fullName,
//     required this.id,
//     required this.email,
//     required this.mobile,
//     required this.password,
//     required this.firstName,
//     required this.lastName,
//     required this.token,
//     required this.userType,
//     // required this.createdBy,
//     // required this.updatedBy,
//     // required this.createdAt,
//     // required this.updatedAt,
//     required this.contact,
//     required this.employee,
//     required this.company,
//   });

//   dynamic fullName;
//   dynamic id;
//   dynamic email;
//   dynamic mobile;
//   dynamic password;
//   dynamic firstName;
//   dynamic lastName;
//   dynamic token;
//   dynamic userType;
//   // dynamic createdBy;
//   // dynamic updatedBy;
//   // DateTime? createdAt;
//   // DateTime? updatedAt;
//   List<dynamic> contact;
//   Employee employee;
//   dynamic company;

//   factory UserData.fromMap(Map<dynamic, dynamic> json) => UserData(
//         fullName: json["fullName"],
//         id: json["id"],
//         email: json["email"],
//         mobile: json["mobile"],
//         password: json["password"],
//         firstName: json["firstName"],
//         lastName: json["lastName"],
//         token: json["token"],
//         userType: json["userType"],
//         // createdBy: json["createdBy"],
//         // updatedBy: json["updatedBy"],
//         // createdAt: DateTime.parse(json["createdAt"]),
//         // updatedAt: DateTime.parse(json["updatedAt"]),
//         contact: List<dynamic>.from(json["contact"].map((x) => x)),
//         employee: Employee.fromMap(json["employee"]),
//         company: json["company"],
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "fullName": fullName,
//         "id": id,
//         "email": email,
//         "mobile": mobile,
//         "password": password,
//         "firstName": firstName,
//         "lastName": lastName,
//         "token": token,
//         "userType": userType,
//         // "createdBy": createdBy,
//         // "updatedBy": updatedBy,
//         // "createdAt": createdAt,
//         // "updatedAt": updatedAt,
//         "contact": List<dynamic>.from(contact.map((x) => x)),
//         "employee": employee.toMap(),
//         "company": company,
//       };
// }

// class Employee {
//   Employee({
//     required this.id,
//     required this.education,
//     required this.fatherName,
//     required this.motherName,
//     required this.dateOfBirth,
//     required this.gender,
//     required this.employmentType,
//     required this.bloodGroup,
//     required this.nomineeName,
//     required this.nomineeRelation,
//     required this.emergencyContact,
//     required this.onRollEmployeeCode,
//     required this.offRollEmployeeCode,
//     required this.onRollEntityId,
//     required this.offRollEntityId,
//     required this.userId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.usersId,
//     required this.employeeOnrollment,
//     required this.employeeOffrollment,
//     required this.addresses,
//     required this.documents,
//     required this.finance,
//     required this.employeeSalary,
//   });

//   dynamic id;
//   dynamic education;
//   dynamic fatherName;
//   dynamic motherName;
//   dynamic dateOfBirth;
//   dynamic gender;
//   dynamic employmentType;
//   dynamic bloodGroup;
//   dynamic nomineeName;
//   dynamic nomineeRelation;
//   dynamic emergencyContact;
//   dynamic onRollEmployeeCode;
//   dynamic offRollEmployeeCode;
//   dynamic onRollEntityId;
//   dynamic offRollEntityId;
//   dynamic userId;
//   DateTime createdAt;
//   DateTime updatedAt;
//   dynamic usersId;
//   dynamic employeeOnrollment;
//   EmployeeOffrollment? employeeOffrollment;
//   List<Address>? addresses;
//   List<Document>? documents;
//   Finance finance;
//   EmployeeSalary employeeSalary;

//   factory Employee.fromMap(Map<dynamic, dynamic> json) => Employee(
//         id: json["id"],
//         education: json["education"],
//         fatherName: json["fatherName"],
//         motherName: json["motherName"],
//         dateOfBirth: json["dateOfBirth"],
//         gender: json["gender"],
//         employmentType: json["employmentType"],
//         bloodGroup: json["bloodGroup"],
//         nomineeName: json["nomineeName"],
//         nomineeRelation: json["nomineeRelation"],
//         emergencyContact: json["emergencyContact"],
//         onRollEmployeeCode: json["onRollEmployeeCode"],
//         offRollEmployeeCode: json["offRollEmployeeCode"],
//         onRollEntityId: json["onRollEntityId"],
//         offRollEntityId: json["offRollEntityId"],
//         userId: json["userId"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         usersId: json["users_id"],
//         employeeOnrollment: json["employeeOnrollment"],
//         employeeOffrollment: json["employeeOffrollment"] == null
//             ? null
//             : EmployeeOffrollment.fromMap(json["employeeOffrollment"]),
//         addresses: List<Address>.from(
//             json["addresses"].map((x) => Address.fromMap(x))),
//         documents: List<Document>.from(
//             json["documents"].map((x) => Document.fromMap(x))),
//         finance: Finance.fromMap(json["finance"]),
//         employeeSalary: EmployeeSalary.fromMap(json["employeeSalary"]),
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id,
//         "education": education,
//         "fatherName": fatherName,
//         "motherName": motherName,
//         "dateOfBirth": dateOfBirth,
//         "gender": gender,
//         "employmentType": employmentType,
//         "bloodGroup": bloodGroup,
//         "nomineeName": nomineeName,
//         "nomineeRelation": nomineeRelation,
//         "emergencyContact": emergencyContact,
//         "onRollEmployeeCode": onRollEmployeeCode,
//         "offRollEmployeeCode": offRollEmployeeCode,
//         "onRollEntityId": onRollEntityId,
//         "offRollEntityId": offRollEntityId,
//         "userId": userId,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "users_id": usersId,
//         "employeeOnrollment": employeeOnrollment,
//         "employeeOffrollment": employeeOffrollment?.toMap(),
//         "addresses": List<dynamic>.from(addresses!.map((x) => x.toMap())),
//         "documents": List<dynamic>.from(documents!.map((x) => x.toMap())),
//         "finance": finance.toMap(),
//         "employeeSalary": employeeSalary.toMap(),
//       };
// }

// class Address {
//   Address({
//     required this.id,
//     required this.addressLine1,
//     required this.addressLine2,
//     required this.countryId,
//     required this.stateId,
//     required this.cityId,
//     required this.pincode,
//     required this.landmark,
//     required this.addressType,
//     required this.employeeId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.addressUserStateId,
//     required this.addressCityId,
//     required this.addressEmployeeId,
//     required this.state,
//     required this.city,
//   });

//   dynamic id;
//   dynamic addressLine1;
//   dynamic addressLine2;
//   dynamic countryId;
//   dynamic stateId;
//   dynamic cityId;
//   dynamic pincode;
//   dynamic landmark;
//   dynamic addressType;
//   dynamic employeeId;
//   DateTime createdAt;
//   DateTime updatedAt;
//   dynamic addressUserStateId;
//   dynamic addressCityId;
//   dynamic addressEmployeeId;
//   UserState state;
//   City city;

//   factory Address.fromMap(Map<dynamic, dynamic> json) => Address(
//         id: json["id"],
//         addressLine1: json["addressLine1"],
//         addressLine2: json["addressLine2"],
//         countryId: json["countryId"],
//         stateId: json["stateId"],
//         cityId: json["cityId"],
//         pincode: json["pincode"],
//         landmark: json["landmark"],
//         addressType: json["addressType"],
//         employeeId: json["employeeId"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         addressUserStateId: json["state_id"],
//         addressCityId: json["city_id"],
//         addressEmployeeId: json["employee_id"],
//         state: UserState.fromMap(json["state"]),
//         city: City.fromMap(json["city"]),
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id,
//         "addressLine1": addressLine1,
//         "addressLine2": addressLine2,
//         "countryId": countryId,
//         "stateId": stateId,
//         "cityId": cityId,
//         "pincode": pincode,
//         "landmark": landmark,
//         "addressType": addressType,
//         "employeeId": employeeId,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "state_id": addressUserStateId,
//         "city_id": addressCityId,
//         "employee_id": addressEmployeeId,
//         "state": state.toMap(),
//         "city": city.toMap(),
//       };
// }

// class City {
//   City({
//     required this.id,
//     required this.name,
//     required this.cityCode,
//     required this.stateId,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   dynamic id;
//   dynamic name;
//   dynamic cityCode;
//   dynamic stateId;
//   DateTime createdAt;
//   DateTime updatedAt;

//   factory City.fromMap(Map<dynamic, dynamic> json) => City(
//         id: json["id"],
//         name: json["name"],
//         cityCode: json["cityCode"],
//         stateId: json["stateId"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id,
//         "name": name,
//         "cityCode": cityCode,
//         "stateId": stateId,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//       };
// }

// class UserState {
//   UserState({
//     required this.id,
//     required this.name,
//     required this.countryId,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   dynamic id;
//   dynamic name;
//   dynamic countryId;
//   DateTime createdAt;
//   DateTime updatedAt;

//   factory UserState.fromMap(Map<dynamic, dynamic> json) => UserState(
//         id: json["id"],
//         name: json["name"],
//         countryId: json["countryId"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id,
//         "name": name,
//         "countryId": countryId,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//       };
// }

// class Document {
//   Document({
//     required this.id,
//     required this.documentName,
//     required this.documentValue,
//     required this.documentExpiry,
//     required this.documentFrontPath,
//     required this.documentBackPath,
//     required this.isMandatory,
//     required this.isVerified,
//     required this.vendorEntityId,
//     required this.documentTypeId,
//     required this.employeeId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.documentTypesId,
//     required this.documentEmployeeId,
//     required this.entityId,
//     required this.documentType,
//   });

//   dynamic id;
//   dynamic documentName;
//   dynamic documentValue;
//   dynamic documentExpiry;
//   dynamic documentFrontPath;
//   dynamic documentBackPath;
//   bool isMandatory;
//   bool isVerified;
//   dynamic vendorEntityId;
//   dynamic documentTypeId;
//   dynamic employeeId;
//   DateTime createdAt;
//   DateTime updatedAt;
//   dynamic documentTypesId;
//   dynamic documentEmployeeId;
//   dynamic entityId;
//   DocumentType documentType;

//   factory Document.fromMap(Map<dynamic, dynamic> json) => Document(
//         id: json["id"],
//         documentName: json["documentName"],
//         documentValue: json["documentValue"],
//         documentExpiry: json["documentExpiry"],
//         documentFrontPath: json["documentFrontPath"],
//         documentBackPath:
//             json["documentBackPath"] == null ? null : json["documentBackPath"],
//         isMandatory: json["isMandatory"],
//         isVerified: json["isVerified"],
//         vendorEntityId: json["vendorEntityId"],
//         documentTypeId: json["documentTypeId"],
//         employeeId: json["employeeId"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         documentTypesId: json["document_types_id"],
//         documentEmployeeId: json["employee_id"],
//         entityId: json["entity_id"],
//         documentType: DocumentType.fromMap(json["DocumentType"]),
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id,
//         "documentName": documentName,
//         "documentValue": documentValue,
//         "documentExpiry": documentExpiry,
//         "documentFrontPath": documentFrontPath,
//         "documentBackPath": documentBackPath == null ? null : documentBackPath,
//         "isMandatory": isMandatory,
//         "isVerified": isVerified,
//         "vendorEntityId": vendorEntityId,
//         "documentTypeId": documentTypeId,
//         "employeeId": employeeId,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "document_types_id": documentTypesId,
//         "employee_id": documentEmployeeId,
//         "entity_id": entityId,
//         "DocumentType": documentType.toMap(),
//       };
// }

// class DocumentType {
//   DocumentType({
//     required this.id,
//     required this.documentName,
//     required this.documentKey,
//     required this.documentHasExpiry,
//     required this.documentHasBack,
//     required this.validCountryId,
//     required this.isVendor,
//     required this.isCompany,
//     required this.isEmployee,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.companyDocuments,
//   });

//   dynamic id;
//   dynamic documentName;
//   dynamic documentKey;
//   bool documentHasExpiry;
//   bool documentHasBack;
//   bool validCountryId;
//   bool isVendor;
//   bool isCompany;
//   bool isEmployee;
//   DateTime createdAt;
//   DateTime updatedAt;
//   List<CompanyDocument> companyDocuments;

//   factory DocumentType.fromMap(Map<dynamic, dynamic> json) => DocumentType(
//         id: json["id"],
//         documentName: json["documentName"],
//         documentKey: json["documentKey"],
//         documentHasExpiry: json["documentHasExpiry"],
//         documentHasBack: json["documentHasBack"],
//         validCountryId: json["validCountryId"],
//         isVendor: json["isVendor"],
//         isCompany: json["isCompany"],
//         isEmployee: json["isEmployee"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         companyDocuments: List<CompanyDocument>.from(
//             json["companyDocuments"].map((x) => CompanyDocument.fromMap(x))),
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id,
//         "documentName": documentName,
//         "documentKey": documentKey,
//         "documentHasExpiry": documentHasExpiry,
//         "documentHasBack": documentHasBack,
//         "validCountryId": validCountryId,
//         "isVendor": isVendor,
//         "isCompany": isCompany,
//         "isEmployee": isEmployee,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "companyDocuments":
//             List<dynamic>.from(companyDocuments.map((x) => x.toMap())),
//       };
// }

// class CompanyDocument {
//   CompanyDocument({
//     required this.id,
//     required this.weightSequence,
//     required this.isVendor,
//     required this.isCompany,
//     required this.isEmployee,
//     required this.isMandatory,
//     required this.countryId,
//     required this.documentTypeId,
//     required this.companyId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.documentTypes,
//   });

//   dynamic id;
//   dynamic weightSequence;
//   bool isVendor;
//   bool isCompany;
//   bool isEmployee;
//   bool isMandatory;
//   dynamic countryId;
//   dynamic documentTypeId;
//   dynamic companyId;
//   DateTime createdAt;
//   DateTime updatedAt;
//   dynamic documentTypes;

//   factory CompanyDocument.fromMap(Map<dynamic, dynamic> json) => CompanyDocument(
//         id: json["id"],
//         weightSequence: json["weightSequence"],
//         isVendor: json["isVendor"],
//         isCompany: json["isCompany"],
//         isEmployee: json["isEmployee"],
//         isMandatory: json["isMandatory"],
//         countryId: json["countryId"],
//         documentTypeId: json["documentTypeId"],
//         companyId: json["companyId"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         documentTypes: json["document_types"],
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id,
//         "weightSequence": weightSequence,
//         "isVendor": isVendor,
//         "isCompany": isCompany,
//         "isEmployee": isEmployee,
//         "isMandatory": isMandatory,
//         "countryId": countryId,
//         "documentTypeId": documentTypeId,
//         "companyId": companyId,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "document_types": documentTypes,
//       };
// }

// class EmployeeOffrollment {
//   EmployeeOffrollment({
//     required this.id,
//     required this.userRoles,
//     required this.designation,
//     required this.department,
//     required this.joiningDate,
//     required this.thisRoleStartDate,
//     required this.lastWorkingDate,
//     required this.isActive,
//     required this.assignedLocationId,
//     required this.employeeCode,
//     required this.onRollEntityId,
//     required this.offRollEntityId,
//     required this.employeeSalaryId,
//     required this.employeeDetailId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.employeeDetailsId,
//   });

//   dynamic id;
//   dynamic userRoles;
//   dynamic designation;
//   dynamic department;
//   DateTime joiningDate;
//   dynamic thisRoleStartDate;
//   dynamic lastWorkingDate;
//   dynamic isActive;
//   dynamic assignedLocationId;
//   dynamic employeeCode;
//   dynamic onRollEntityId;
//   dynamic offRollEntityId;
//   dynamic employeeSalaryId;
//   dynamic employeeDetailId;
//   DateTime createdAt;
//   DateTime updatedAt;
//   dynamic employeeDetailsId;

//   factory EmployeeOffrollment.fromMap(Map<dynamic, dynamic> json) =>
//       EmployeeOffrollment(
//         id: json["id"],
//         userRoles: json["userRoles"],
//         designation: json["designation"],
//         department: json["department"],
//         joiningDate: DateTime.parse(json["joiningDate"]),
//         thisRoleStartDate: json["thisRoleStartDate"],
//         lastWorkingDate: json["lastWorkingDate"],
//         isActive: json["isActive"],
//         assignedLocationId: json["assignedLocationId"],
//         employeeCode: json["employeeCode"],
//         onRollEntityId: json["onRollEntityId"],
//         offRollEntityId: json["offRollEntityId"],
//         employeeSalaryId: json["employeeSalaryId"],
//         employeeDetailId: json["employeeDetailId"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         employeeDetailsId: json["employee_details_id"],
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id,
//         "userRoles": userRoles,
//         "designation": designation,
//         "department": department,
//         "joiningDate": joiningDate.toIso8601String(),
//         "thisRoleStartDate": thisRoleStartDate,
//         "lastWorkingDate": lastWorkingDate,
//         "isActive": isActive,
//         "assignedLocationId": assignedLocationId,
//         "employeeCode": employeeCode,
//         "onRollEntityId": onRollEntityId,
//         "offRollEntityId": offRollEntityId,
//         "employeeSalaryId": employeeSalaryId,
//         "employeeDetailId": employeeDetailId,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "employee_details_id": employeeDetailsId,
//       };
// }

// class EmployeeSalary {
//   EmployeeSalary({
//     required this.id,
//     required this.employmentType,
//     required this.ctcValue,
//     required this.isActive,
//     required this.startDate,
//     required this.endDate,
//     required this.employeeId,
//     required this.salaryStructureCompanyId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.employeeDetailsId,
//     required this.employeeSalarySalaryStructureCompanyId,
//     required this.structure,
//     required this.monthlyEarning,
//     required this.employeeSalaryComponent,
//   });

//   dynamic id;
//   dynamic employmentType;
//   dynamic ctcValue;
//   bool isActive;
//   dynamic startDate;
//   dynamic endDate;
//   dynamic employeeId;
//   dynamic salaryStructureCompanyId;
//   DateTime createdAt;
//   DateTime updatedAt;
//   dynamic employeeDetailsId;
//   dynamic employeeSalarySalaryStructureCompanyId;
//   Structure structure;
//   MonthlyEarning? monthlyEarning;
//   List<EmployeeSalaryComponent> employeeSalaryComponent;

//   factory EmployeeSalary.fromMap(Map<dynamic, dynamic> json) => EmployeeSalary(
//         id: json["id"],
//         employmentType: json["employmentType"],
//         ctcValue: json["ctcValue"],
//         isActive: json["isActive"],
//         startDate: json["startDate"],
//         endDate: json["endDate"],
//         employeeId: json["employeeId"],
//         salaryStructureCompanyId: json["salaryStructureCompanyId"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         employeeDetailsId: json["employee_details_id"],
//         employeeSalarySalaryStructureCompanyId:
//             json["salary_structure_company_id"],
//         structure: Structure.fromMap(json["structure"]),
//         monthlyEarning: json["monthlyEarning"] == null
//             ? null
//             : MonthlyEarning.fromMap(json["monthlyEarning"]),
//         employeeSalaryComponent: List<EmployeeSalaryComponent>.from(
//             json["employeeSalaryComponent"]
//                 .map((x) => EmployeeSalaryComponent.fromMap(x))),
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id,
//         "employmentType": employmentType,
//         "ctcValue": ctcValue,
//         "isActive": isActive,
//         "startDate": startDate,
//         "endDate": endDate,
//         "employeeId": employeeId,
//         "salaryStructureCompanyId": salaryStructureCompanyId,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "employee_details_id": employeeDetailsId,
//         "salary_structure_company_id": employeeSalarySalaryStructureCompanyId,
//         "structure": structure.toMap(),
//         "monthlyEarning": monthlyEarning?.toMap(),
//         "employeeSalaryComponent":
//             List<dynamic>.from(employeeSalaryComponent.map((x) => x.toMap())),
//       };
// }

// class EmployeeSalaryComponent {
//   EmployeeSalaryComponent({
//     required this.id,
//     required this.structureCompon,
//     required this.componentCode,
//     required this.salaryStructure,
//     required this.employeeSalaryI,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.employeeSalary,
//   });

//   dynamic id;
//   dynamic structureCompon;
//   dynamic componentCode;
//   dynamic salaryStructure;
//   dynamic employeeSalaryI;
//   DateTime createdAt;
//   DateTime updatedAt;
//   dynamic employeeSalary;

//   factory EmployeeSalaryComponent.fromMap(Map<dynamic, dynamic> json) =>
//       EmployeeSalaryComponent(
//         id: json["id"],
//         structureCompon: json["StructureCompon"],
//         componentCode: json["componentCode"],
//         salaryStructure: json["salaryStructure"],
//         employeeSalaryI: json["employeeSalaryI"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         employeeSalary: json["employee_salary"],
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id,
//         "StructureCompon": structureCompon,
//         "componentCode": componentCode,
//         "salaryStructure": salaryStructure,
//         "employeeSalaryI": employeeSalaryI,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "employee_salary": employeeSalary,
//       };
// }

// class MonthlyEarning {
//   MonthlyEarning({
//     required this.id,
//     required this.totalSalaryRelease,
//     required this.salaryMonth,
//     required this.salaryYear,
//     required this.releaseDate,
//     required this.presentDays,
//     required this.payableDays,
//     required this.absentDays,
//     required this.tds,
//     required this.status,
//     required this.employeeSalaryId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.monthlyEarningEmployeeSalaryId,
//     required this.earningComponent,
//   });

//   dynamic id;
//   dynamic totalSalaryRelease;
//   dynamic salaryMonth;
//   dynamic salaryYear;
//   dynamic releaseDate;
//   dynamic presentDays;
//   dynamic payableDays;
//   dynamic absentDays;
//   dynamic tds;
//   dynamic status;
//   dynamic employeeSalaryId;
//   DateTime createdAt;
//   DateTime updatedAt;
//   dynamic monthlyEarningEmployeeSalaryId;
//   List<dynamic> earningComponent;

//   factory MonthlyEarning.fromMap(Map<dynamic, dynamic> json) => MonthlyEarning(
//         id: json["id"],
//         totalSalaryRelease: json["totalSalaryRelease"],
//         salaryMonth: json["salaryMonth"],
//         salaryYear: json["salaryYear"],
//         releaseDate: json["releaseDate"],
//         presentDays: json["presentDays"],
//         payableDays: json["payableDays"],
//         absentDays: json["absentDays"],
//         tds: json["TDS"],
//         status: json["status"],
//         employeeSalaryId: json["employeeSalaryId"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         monthlyEarningEmployeeSalaryId: json["employee_salary_id"],
//         earningComponent:
//             List<dynamic>.from(json["earningComponent"].map((x) => x)),
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id,
//         "totalSalaryRelease": totalSalaryRelease,
//         "salaryMonth": salaryMonth,
//         "salaryYear": salaryYear,
//         "releaseDate": releaseDate,
//         "presentDays": presentDays,
//         "payableDays": payableDays,
//         "absentDays": absentDays,
//         "TDS": tds,
//         "status": status,
//         "employeeSalaryId": employeeSalaryId,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "employee_salary_id": monthlyEarningEmployeeSalaryId,
//         "earningComponent": List<dynamic>.from(earningComponent.map((x) => x)),
//       };
// }

// class Structure {
//   Structure({
//     required this.id,
//     required this.structureName,
//     required this.ctcGross,
//     required this.isPfApplicable,
//     required this.isPfApplicableAbove15,
//     required this.isPfCaelingApplicable,
//     required this.isEsicApplicable,
//     required this.isLwfApplicable,
//     required this.companyId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.component,
//   });

//   dynamic id;
//   dynamic structureName;
//   dynamic ctcGross;
//   bool isPfApplicable;
//   bool isPfApplicableAbove15;
//   bool isPfCaelingApplicable;
//   bool isEsicApplicable;
//   bool isLwfApplicable;
//   dynamic companyId;
//   DateTime createdAt;
//   DateTime updatedAt;
//   List<Component> component;

//   factory Structure.fromMap(Map<dynamic, dynamic> json) => Structure(
//         id: json["id"],
//         structureName: json["structureName"],
//         ctcGross: json["ctcGross"],
//         isPfApplicable: json["isPfApplicable"],
//         isPfApplicableAbove15: json["isPfApplicableAbove15"],
//         isPfCaelingApplicable: json["isPfCaelingApplicable"],
//         isEsicApplicable: json["isEsicApplicable"],
//         isLwfApplicable: json["isLwfApplicable"],
//         companyId: json["companyId"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         component: List<Component>.from(
//             json["component"].map((x) => Component.fromMap(x))),
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id,
//         "structureName": structureName,
//         "ctcGross": ctcGross,
//         "isPfApplicable": isPfApplicable,
//         "isPfApplicableAbove15": isPfApplicableAbove15,
//         "isPfCaelingApplicable": isPfCaelingApplicable,
//         "isEsicApplicable": isEsicApplicable,
//         "isLwfApplicable": isLwfApplicable,
//         "companyId": companyId,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "component": List<dynamic>.from(component.map((x) => x.toMap())),
//       };
// }

// class Component {
//   Component({
//     required this.id,
//     required this.componentFormula,
//     required this.salaryComponentId,
//     required this.salaryStructureComp,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.salaryStructureCo,
//     required this.componentSalaryComponentId,
//     required this.defaultComponent,
//   });

//   dynamic id;
//   dynamic componentFormula;
//   dynamic salaryComponentId;
//   dynamic salaryStructureComp;
//   DateTime createdAt;
//   DateTime updatedAt;
//   dynamic salaryStructureCo;
//   dynamic componentSalaryComponentId;
//   DefaultComponent defaultComponent;

//   factory Component.fromMap(Map<dynamic, dynamic> json) => Component(
//         id: json["id"],
//         componentFormula: json["componentFormula"],
//         salaryComponentId: json["salaryComponentId"],
//         salaryStructureComp: json["salaryStructureComp"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         salaryStructureCo: json["salary_structure_co"],
//         componentSalaryComponentId: json["salary_component_id"],
//         defaultComponent: DefaultComponent.fromMap(json["defaultComponent"]),
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id,
//         "componentFormula": componentFormula,
//         "salaryComponentId": salaryComponentId,
//         "salaryStructureComp": salaryStructureComp,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "salary_structure_co": salaryStructureCo,
//         "salary_component_id": componentSalaryComponentId,
//         "defaultComponent": defaultComponent.toMap(),
//       };
// }

// class DefaultComponent {
//   DefaultComponent({
//     required this.id,
//     required this.co,
//     required this.de,
//     required this.defaultComponentIs,
//     required this.va,
//     required this.ap,
//     required this.cr,
//     required this.up,
//   });

//   dynamic id;
//   dynamic co;
//   dynamic de;
//   bool defaultComponentIs;
//   dynamic va;
//   dynamic ap;
//   DateTime cr;
//   DateTime up;

//   factory DefaultComponent.fromMap(Map<dynamic, dynamic> json) =>
//       DefaultComponent(
//         id: json["id"],
//         co: json["co"],
//         de: json["de"],
//         defaultComponentIs: json["is"],
//         va: json["va"],
//         ap: json["ap"],
//         cr: DateTime.parse(json["cr"]),
//         up: DateTime.parse(json["up"]),
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id,
//         "co": co,
//         "de": de,
//         "is": defaultComponentIs,
//         "va": va,
//         "ap": ap,
//         "cr": cr.toIso8601String(),
//         "up": up.toIso8601String(),
//       };
// }

// class Finance {
//   Finance({
//     required this.id,
//     required this.accountHolderName,
//     required this.accountNumber,
//     required this.ifscCode,
//     required this.bankName,
//     required this.accountType,
//     required this.branchName,
//     required this.cancelledChequePath,
//     required this.swiftCode,
//     required this.entityId,
//     required this.employeeId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.financeEmployeeId,
//     required this.financeEntityId,
//   });

//   dynamic id;
//   dynamic accountHolderName;
//   dynamic accountNumber;
//   dynamic ifscCode;
//   dynamic bankName;
//   dynamic accountType;
//   dynamic branchName;
//   dynamic cancelledChequePath;
//   dynamic swiftCode;
//   dynamic entityId;
//   dynamic employeeId;
//   DateTime createdAt;
//   DateTime updatedAt;
//   dynamic financeEmployeeId;
//   dynamic financeEntityId;

//   factory Finance.fromMap(Map<dynamic, dynamic> json) => Finance(
//         id: json["id"],
//         accountHolderName: json["accountHolderName"],
//         accountNumber: json["accountNumber"],
//         ifscCode: json["ifscCode"],
//         bankName: json["bankName"],
//         accountType: json["accountType"],
//         branchName: json["branchName"],
//         cancelledChequePath: json["cancelledChequePath"],
//         swiftCode: json["swiftCode"],
//         entityId: json["entityId"],
//         employeeId: json["employeeId"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         financeEmployeeId: json["employee_id"],
//         financeEntityId: json["entity_id"],
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id,
//         "accountHolderName": accountHolderName,
//         "accountNumber": accountNumber,
//         "ifscCode": ifscCode,
//         "bankName": bankName,
//         "accountType": accountType,
//         "branchName": branchName,
//         "cancelledChequePath": cancelledChequePath,
//         "swiftCode": swiftCode,
//         "entityId": entityId,
//         "employeeId": employeeId,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "employee_id": financeEmployeeId,
//         "entity_id": financeEntityId,
//       };
// }

// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString)

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// import 'package:meta/meta.dart';
// import 'dart:convert';

// UserModel userModelFromMap(dynamic str) => UserModel.fromMap(json.decode(str));

// dynamic userModelToMap(UserModel data) => json.encode(data.toMap());

// class UserModel {
//   UserModel({
//     this.userData,
//     this.token,
//   });

//   UserData? userData;
//   dynamic? token;

//   factory UserModel.fromMap(Map<dynamic, dynamic> json) => UserModel(
//         userData: json["userData"] == null
//             ? null
//             : UserData.fromMap(json["userData"]),
//         token: json["token"] == null ? null : json["token"],
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "userData": userData == null ? null : userData?.toMap(),
//         "token": token == null ? null : token,
//       };
// }

// class UserData {
//   UserData({
//     required this.fullName,
//     required this.id,
//     required this.email,
//     required this.mobile,
//     required this.password,
//     required this.firstName,
//     required this.lastName,
//     required this.token,
//     required this.userType,
//     // required this.createdBy,
//     // required this.updatedBy,
//     // required this.createdAt,
//     // required this.updatedAt,
//     required this.contact,
//     required this.employee,
//     required this.company,
//   });

//   String? fullName;
//   dynamic id;
//   dynamic email;
//   dynamic mobile;
//   dynamic password;
//   dynamic firstName;
//   dynamic lastName;
//   dynamic token;
//   dynamic userType;
//   // dynamic createdBy;
//   // dynamic updatedBy;
//   // DateTime? createdAt;
//   // DateTime? updatedAt;
//   List<dynamic>? contact;
//   Employee? employee;
//   dynamic company;

//   factory UserData.fromMap(Map<dynamic, dynamic> json) => UserData(
//         fullName: json["fullName"] == null ? null : json["fullName"],
//         id: json["id"] == null ? null : json["id"],
//         email: json["email"] == null ? null : json["email"],
//         mobile: json["mobile"] == null ? null : json["mobile"],
//         password: json["password"] == null ? null : json["password"],
//         firstName: json["firstName"] == null ? null : json["firstName"],
//         lastName: json["lastName"] == null ? null : json["lastName"],
//         token: json["token"] == null ? null : json["token"],
//         userType: json["userType"] == null ? null : json["userType"],
//         // createdBy: json["createdBy"],
//         // updatedBy: json["updatedBy"],
//         // createdAt: json["createdAt"] == null
//         //     ? null
//         //     : DateTime.parse(json["createdAt"]),
//         // updatedAt: json["updatedAt"] == null
//         //     ? null
//         //     : DateTime.parse(json["updatedAt"]),
//         contact: json["contact"] == null
//             ? null
//             : List<dynamic>.from(json["contact"].map((x) => x)),
//         employee: json["employee"] == null
//             ? null
//             : Employee.fromMap(json["employee"]),
//         company: json["company"],
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "fullName": fullName == null ? null : fullName,
//         "id": id == null ? null : id,
//         "email": email == null ? null : email,
//         "mobile": mobile == null ? null : mobile,
//         "password": password == null ? null : password,
//         "firstName": firstName == null ? null : firstName,
//         "lastName": lastName == null ? null : lastName,
//         "token": token == null ? null : token,
//         "userType": userType == null ? null : userType,
//         // "createdBy": createdBy,
//         // "updatedBy": updatedBy,
//         // "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
//         // "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
//         "contact":
//             contact == null ? null : List<dynamic>.from(contact!.map((x) => x)),
//         "employee": employee == null ? null : employee?.toMap() ?? " ",
//         "company": company,
//       };
// }

// class Employee {
//   Employee({
//     required this.id,
//     required this.education,
//     required this.fatherName,
//     required this.motherName,
//     required this.dateOfBirth,
//     required this.gender,
//     required this.employmentType,
//     required this.bloodGroup,
//     required this.nomineeName,
//     required this.nomineeRelation,
//     required this.emergencyContact,
//     required this.onRollEmployeeCode,
//     required this.offRollEmployeeCode,
//     required this.onRollEntityId,
//     required this.offRollEntityId,
//     required this.userId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.usersId,
//     required this.employeeOnrollment,
//     required this.employeeOffrollment,
//     required this.addresses,
//     required this.documents,
//     required this.finance,
//     required this.employeeSalary,
//   });

//   dynamic id;
//   dynamic education;
//   dynamic fatherName;
//   dynamic motherName;
//   dynamic dateOfBirth;
//   dynamic gender;
//   dynamic employmentType;
//   dynamic bloodGroup;
//   dynamic nomineeName;
//   dynamic nomineeRelation;
//   dynamic emergencyContact;
//   dynamic onRollEmployeeCode;
//   dynamic offRollEmployeeCode;
//   dynamic onRollEntityId;
//   dynamic offRollEntityId;
//   dynamic userId;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic usersId;
//   dynamic employeeOnrollment;
//   EmployeeOffrollment? employeeOffrollment;
//   List<Address>? addresses;
//   List<Document>? documents;
//   Finance? finance;
//   EmployeeSalary? employeeSalary;

//   factory Employee.fromMap(Map<dynamic, dynamic> json) => Employee(
//         id: json["id"] == null ? null : json["id"],
//         education: json["education"] == null ? null : json["education"],
//         fatherName: json["fatherName"],
//         motherName: json["motherName"],
//         dateOfBirth: json["dateOfBirth"],
//         gender: json["gender"] == null ? null : json["gender"],
//         employmentType:
//             json["employmentType"] == null ? null : json["employmentType"],
//         bloodGroup: json["bloodGroup"] == null ? null : json["bloodGroup"],
//         nomineeName: json["nomineeName"] == null ? null : json["nomineeName"],
//         nomineeRelation:
//             json["nomineeRelation"] == null ? null : json["nomineeRelation"],
//         emergencyContact:
//             json["emergencyContact"] == null ? null : json["emergencyContact"],
//         onRollEmployeeCode: json["onRollEmployeeCode"] == null
//             ? null
//             : json["onRollEmployeeCode"],
//         offRollEmployeeCode: json["offRollEmployeeCode"] == null
//             ? null
//             : json["offRollEmployeeCode"],
//         onRollEntityId:
//             json["onRollEntityId"] == null ? null : json["onRollEntityId"],
//         offRollEntityId:
//             json["offRollEntityId"] == null ? null : json["offRollEntityId"],
//         userId: json["userId"] == null ? null : json["userId"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//         usersId: json["users_id"] == null ? null : json["users_id"],
//         employeeOnrollment: json["employeeOnrollment"],
//         employeeOffrollment: json["employeeOffrollment"] == null
//             ? null
//             : EmployeeOffrollment.fromMap(json["employeeOffrollment"]),
//         addresses: json["addresses"] == null
//             ? null
//             : List<Address>.from(
//                 json["addresses"].map((x) => Address.fromMap(x))),
//         documents: json["documents"] == null
//             ? null
//             : List<Document>.from(
//                 json["documents"].map((x) => Document.fromMap(x))),
//         finance:
//             json["finance"] == null ? null : Finance.fromMap(json["finance"]),
//         employeeSalary: json["employeeSalary"] == null
//             ? null
//             : EmployeeSalary.fromMap(json["employeeSalary"]),
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "education": education == null ? null : education,
//         "fatherName": fatherName,
//         "motherName": motherName,
//         "dateOfBirth": dateOfBirth,
//         "gender": gender == null ? null : gender,
//         "employmentType": employmentType == null ? null : employmentType,
//         "bloodGroup": bloodGroup == null ? null : bloodGroup,
//         "nomineeName": nomineeName == null ? null : nomineeName,
//         "nomineeRelation": nomineeRelation == null ? null : nomineeRelation,
//         "emergencyContact": emergencyContact == null ? null : emergencyContact,
//         "onRollEmployeeCode":
//             onRollEmployeeCode == null ? null : onRollEmployeeCode,
//         "offRollEmployeeCode":
//             offRollEmployeeCode == null ? null : offRollEmployeeCode,
//         "onRollEntityId": onRollEntityId == null ? null : onRollEntityId,
//         "offRollEntityId": offRollEntityId == null ? null : offRollEntityId,
//         "userId": userId == null ? null : userId,
//         "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
//         "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
//         "users_id": usersId == null ? null : usersId,
//         "employeeOnrollment": employeeOnrollment,
//         "employeeOffrollment":
//             employeeOffrollment == null ? null : employeeOffrollment?.toMap(),
//         "addresses": addresses == null
//             ? null
//             : List<dynamic>.from(addresses!.map((x) => x.toMap())),
//         "documents": documents == null
//             ? null
//             : List<dynamic>.from(documents!.map((x) => x.toMap())),
//         "finance": finance == null ? null : finance?.toMap(),
//         "employeeSalary":
//             employeeSalary == null ? null : employeeSalary?.toMap(),
//       };
// }

// class Address {
//   Address({
//     required this.id,
//     required this.addressLine1,
//     required this.addressLine2,
//     required this.countryId,
//     required this.stateId,
//     required this.cityId,
//     required this.pincode,
//     required this.landmark,
//     required this.addressType,
//     required this.employeeId,
//     required this.createdAt,
//     required this.updatedAt,
//     // required this.addressStateId,
//     // required this.addressCityId,
//     // required this.addressEmployeeId,
//     required this.state,
//     required this.city,
//   });

//   dynamic id;
//   dynamic addressLine1;
//   dynamic addressLine2;
//   dynamic countryId;
//   dynamic stateId;
//   dynamic cityId;
//   dynamic pincode;
//   dynamic landmark;
//   dynamic addressType;
//   dynamic employeeId;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   // dynamic addressStateId;
//   // dynamic addressCityId;
//   // dynamic addressEmployeeId;
//   UserState? state;
//   City? city;

//   factory Address.fromMap(Map<dynamic, dynamic> json) => Address(
//         id: json["id"] == null ? null : json["id"],
//         addressLine1:
//             json["addressLine1"] == null ? null : json["addressLine1"],
//         addressLine2:
//             json["addressLine2"] == null ? null : json["addressLine2"],
//         countryId: json["countryId"],
//         stateId: json["stateId"] == null ? null : json["stateId"],
//         cityId: json["cityId"] == null ? null : json["cityId"],
//         pincode: json["pincode"] == null ? null : json["pincode"],
//         landmark: json["landmark"] == null ? null : json["landmark"],
//         addressType: json["addressType"] == null ? null : json["addressType"],
//         employeeId: json["employeeId"] == null ? null : json["employeeId"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//         // addressStateId: json["state_id"] == null ? null : json["state_id"],
//         // addressCityId: json["city_id"] == null ? null : json["city_id"],
//         // addressEmployeeId:
//         // json["employee_id"] == null ? null : json["employee_id"],
//         state: json["state"] == null ? null : UserState.fromMap(json["state"]),
//         city: json["city"] == null ? null : City.fromMap(json["city"]),
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "addressLine1": addressLine1 == null ? null : addressLine1,
//         "addressLine2": addressLine2 == null ? null : addressLine2,
//         "countryId": countryId,
//         "stateId": stateId == null ? null : stateId,
//         "cityId": cityId == null ? null : cityId,
//         "pincode": pincode == null ? null : pincode,
//         "landmark": landmark == null ? null : landmark,
//         "addressType": addressType == null ? null : addressType,
//         "employeeId": employeeId == null ? null : employeeId,
//         "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
//         "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
//         // "state_id": addressStateId == null ? null : addressStateId,
//         // "city_id": addressCityId == null ? null : addressCityId,
//         // "employee_id": addressEmployeeId == null ? null : addressEmployeeId,
//         "state": state == null ? null : state?.toMap(),
//         "city": city == null ? null : city?.toMap(),
//       };
// }

// class City {
//   City({
//     required this.id,
//     required this.name,
//     required this.cityCode,
//     required this.stateId,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   dynamic id;
//   dynamic name;
//   dynamic cityCode;
//   dynamic stateId;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   factory City.fromMap(Map<dynamic, dynamic> json) => City(
//         id: json["id"] == null ? null : json["id"],
//         name: json["name"] == null ? null : json["name"],
//         cityCode: json["cityCode"] == null ? null : json["cityCode"],
//         stateId: json["stateId"] == null ? null : json["stateId"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "name": name == null ? null : name,
//         "cityCode": cityCode == null ? null : cityCode,
//         "stateId": stateId == null ? null : stateId,
//         "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
//         "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
//       };
// }

// class UserState {
//   UserState({
//     required this.id,
//     required this.name,
//     required this.countryId,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   dynamic id;
//   dynamic name;
//   dynamic countryId;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   factory UserState.fromMap(Map<dynamic, dynamic> json) => UserState(
//         id: json["id"] == null ? null : json["id"],
//         name: json["name"] == null ? null : json["name"],
//         countryId: json["countryId"] == null ? null : json["countryId"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "name": name == null ? null : name,
//         "countryId": countryId == null ? null : countryId,
//         "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
//         "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
//       };
// }

// class Document {
//   Document({
//     required this.id,
//     required this.documentName,
//     required this.documentValue,
//     required this.documentExpiry,
//     required this.documentFrontPath,
//     required this.documentBackPath,
//     required this.isMandatory,
//     required this.isVerified,
//     required this.vendorEntityId,
//     required this.documentTypeId,
//     required this.employeeId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.documentTypesId,
//     required this.documentEmployeeId,
//     required this.entityId,
//     required this.documentType,
//   });

//   dynamic id;
//   dynamic documentName;
//   dynamic documentValue;
//   dynamic documentExpiry;
//   dynamic documentFrontPath;
//   dynamic documentBackPath;
//   bool isMandatory;
//   bool isVerified;
//   dynamic vendorEntityId;
//   dynamic documentTypeId;
//   dynamic employeeId;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic documentTypesId;
//   dynamic documentEmployeeId;
//   dynamic entityId;
//   DocumentType? documentType;

//   factory Document.fromMap(Map<dynamic, dynamic> json) => Document(
//         id: json["id"] == null ? null : json["id"],
//         documentName:
//             json["documentName"] == null ? null : json["documentName"],
//         documentValue:
//             json["documentValue"] == null ? null : json["documentValue"],
//         documentExpiry: json["documentExpiry"],
//         documentFrontPath: json["documentFrontPath"] == null
//             ? null
//             : json["documentFrontPath"],
//         documentBackPath:
//             json["documentBackPath"] == null ? null : json["documentBackPath"],
//         isMandatory: json["isMandatory"] == null ? null : json["isMandatory"],
//         isVerified: json["isVerified"] == null ? null : json["isVerified"],
//         vendorEntityId: json["vendorEntityId"],
//         documentTypeId:
//             json["documentTypeId"] == null ? null : json["documentTypeId"],
//         employeeId: json["employeeId"] == null ? null : json["employeeId"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//         documentTypesId: json["document_types_id"] == null
//             ? null
//             : json["document_types_id"],
//         documentEmployeeId:
//             json["employee_id"] == null ? null : json["employee_id"],
//         entityId: json["entity_id"],
//         documentType: json["DocumentType"] == null
//             ? null
//             : DocumentType.fromMap(json["DocumentType"]),
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "documentName": documentName == null ? null : documentName,
//         "documentValue": documentValue == null ? null : documentValue,
//         "documentExpiry": documentExpiry,
//         "documentFrontPath":
//             documentFrontPath == null ? null : documentFrontPath,
//         "documentBackPath": documentBackPath == null ? null : documentBackPath,
//         "isMandatory": isMandatory == null ? null : isMandatory,
//         "isVerified": isVerified == null ? null : isVerified,
//         "vendorEntityId": vendorEntityId,
//         "documentTypeId": documentTypeId == null ? null : documentTypeId,
//         "employeeId": employeeId == null ? null : employeeId,
//         "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
//         "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
//         "document_types_id": documentTypesId == null ? null : documentTypesId,
//         "employee_id": documentEmployeeId == null ? null : documentEmployeeId,
//         "entity_id": entityId,
//         "DocumentType": documentType == null ? null : documentType?.toMap(),
//       };
// }

// class DocumentType {
//   DocumentType({
//     required this.id,
//     required this.documentName,
//     required this.documentKey,
//     required this.documentHasExpiry,
//     required this.documentHasBack,
//     required this.validCountryId,
//     required this.isVendor,
//     required this.isCompany,
//     required this.isEmployee,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.companyDocuments,
//   });

//   dynamic id;
//   dynamic documentName;
//   dynamic documentKey;
//   bool documentHasExpiry;
//   bool documentHasBack;
//   bool validCountryId;
//   bool isVendor;
//   bool isCompany;
//   bool isEmployee;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   List<CompanyDocument>? companyDocuments;

//   factory DocumentType.fromMap(Map<dynamic, dynamic> json) => DocumentType(
//         id: json["id"] == null ? null : json["id"],
//         documentName:
//             json["documentName"] == null ? null : json["documentName"],
//         documentKey: json["documentKey"] == null ? null : json["documentKey"],
//         documentHasExpiry: json["documentHasExpiry"] == null
//             ? null
//             : json["documentHasExpiry"],
//         documentHasBack:
//             json["documentHasBack"] == null ? null : json["documentHasBack"],
//         validCountryId:
//             json["validCountryId"] == null ? null : json["validCountryId"],
//         isVendor: json["isVendor"] == null ? null : json["isVendor"],
//         isCompany: json["isCompany"] == null ? null : json["isCompany"],
//         isEmployee: json["isEmployee"] == null ? null : json["isEmployee"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//         companyDocuments: json["companyDocuments"] == null
//             ? null
//             : List<CompanyDocument>.from(json["companyDocuments"]
//                 .map((x) => CompanyDocument.fromMap(x))),
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "documentName": documentName == null ? null : documentName,
//         "documentKey": documentKey == null ? null : documentKey,
//         "documentHasExpiry":
//             documentHasExpiry == null ? null : documentHasExpiry,
//         "documentHasBack": documentHasBack == null ? null : documentHasBack,
//         "validCountryId": validCountryId == null ? null : validCountryId,
//         "isVendor": isVendor == null ? null : isVendor,
//         "isCompany": isCompany == null ? null : isCompany,
//         "isEmployee": isEmployee == null ? null : isEmployee,
//         "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
//         "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
//         "companyDocuments": companyDocuments == null
//             ? null
//             : List<dynamic>.from(companyDocuments!.map((x) => x.toMap())),
//       };
// }

// class CompanyDocument {
//   CompanyDocument({
//     required this.id,
//     required this.weightSequence,
//     required this.isVendor,
//     required this.isCompany,
//     required this.isEmployee,
//     required this.isMandatory,
//     required this.countryId,
//     required this.documentTypeId,
//     required this.companyId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.documentTypes,
//   });

//   dynamic id;
//   dynamic weightSequence;
//   bool isVendor;
//   bool isCompany;
//   bool isEmployee;
//   bool isMandatory;
//   dynamic countryId;
//   dynamic documentTypeId;
//   dynamic companyId;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic documentTypes;

//   factory CompanyDocument.fromMap(Map<dynamic, dynamic> json) =>
//       CompanyDocument(
//         id: json["id"] == null ? null : json["id"],
//         weightSequence:
//             json["weightSequence"] == null ? null : json["weightSequence"],
//         isVendor: json["isVendor"] == null ? null : json["isVendor"],
//         isCompany: json["isCompany"] == null ? null : json["isCompany"],
//         isEmployee: json["isEmployee"] == null ? null : json["isEmployee"],
//         isMandatory: json["isMandatory"] == null ? null : json["isMandatory"],
//         countryId: json["countryId"] == null ? null : json["countryId"],
//         documentTypeId:
//             json["documentTypeId"] == null ? null : json["documentTypeId"],
//         companyId: json["companyId"] == null ? null : json["companyId"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//         documentTypes:
//             json["document_types"] == null ? null : json["document_types"],
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "weightSequence": weightSequence == null ? null : weightSequence,
//         "isVendor": isVendor == null ? null : isVendor,
//         "isCompany": isCompany == null ? null : isCompany,
//         "isEmployee": isEmployee == null ? null : isEmployee,
//         "isMandatory": isMandatory == null ? null : isMandatory,
//         "countryId": countryId == null ? null : countryId,
//         "documentTypeId": documentTypeId == null ? null : documentTypeId,
//         "companyId": companyId == null ? null : companyId,
//         "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
//         "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
//         "document_types": documentTypes == null ? null : documentTypes,
//       };
// }

// class EmployeeOffrollment {
//   EmployeeOffrollment({
//     required this.id,
//     required this.userRoles,
//     required this.designation,
//     required this.department,
//     required this.joiningDate,
//     required this.thisRoleStartDate,
//     required this.lastWorkingDate,
//     required this.isActive,
//     required this.assignedLocationId,
//     required this.employeeCode,
//     required this.onRollEntityId,
//     required this.offRollEntityId,
//     required this.employeeSalaryId,
//     required this.employeeDetailId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.employeeDetailsId,
//   });

//   dynamic id;
//   dynamic userRoles;
//   dynamic designation;
//   dynamic department;
//   DateTime? joiningDate;
//   dynamic thisRoleStartDate;
//   dynamic lastWorkingDate;
//   dynamic isActive;
//   dynamic assignedLocationId;
//   dynamic employeeCode;
//   dynamic onRollEntityId;
//   dynamic offRollEntityId;
//   dynamic employeeSalaryId;
//   dynamic employeeDetailId;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic employeeDetailsId;

//   factory EmployeeOffrollment.fromMap(Map<dynamic, dynamic> json) =>
//       EmployeeOffrollment(
//         id: json["id"] == null ? null : json["id"],
//         userRoles: json["userRoles"],
//         designation: json["designation"] == null ? null : json["designation"],
//         department: json["department"] == null ? null : json["department"],
//         joiningDate: json["joiningDate"] == null
//             ? null
//             : DateTime.parse(json["joiningDate"]),
//         thisRoleStartDate: json["thisRoleStartDate"],
//         lastWorkingDate: json["lastWorkingDate"],
//         isActive: json["isActive"],
//         assignedLocationId: json["assignedLocationId"] == null
//             ? null
//             : json["assignedLocationId"],
//         employeeCode: json["employeeCode"],
//         onRollEntityId:
//             json["onRollEntityId"] == null ? null : json["onRollEntityId"],
//         offRollEntityId:
//             json["offRollEntityId"] == null ? null : json["offRollEntityId"],
//         employeeSalaryId: json["employeeSalaryId"],
//         employeeDetailId:
//             json["employeeDetailId"] == null ? null : json["employeeDetailId"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//         employeeDetailsId: json["employee_details_id"] == null
//             ? null
//             : json["employee_details_id"],
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "userRoles": userRoles,
//         "designation": designation == null ? null : designation,
//         "department": department == null ? null : department,
//         "joiningDate":
//             joiningDate == null ? null : joiningDate?.toIso8601String(),
//         "thisRoleStartDate": thisRoleStartDate,
//         "lastWorkingDate": lastWorkingDate,
//         "isActive": isActive,
//         "assignedLocationId":
//             assignedLocationId == null ? null : assignedLocationId,
//         "employeeCode": employeeCode,
//         "onRollEntityId": onRollEntityId == null ? null : onRollEntityId,
//         "offRollEntityId": offRollEntityId == null ? null : offRollEntityId,
//         "employeeSalaryId": employeeSalaryId,
//         "employeeDetailId": employeeDetailId == null ? null : employeeDetailId,
//         "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
//         "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
//         "employee_details_id":
//             employeeDetailsId == null ? null : employeeDetailsId,
//       };
// }

// class EmployeeSalary {
//   EmployeeSalary({
//     required this.id,
//     required this.employmentType,
//     required this.ctcValue,
//     required this.isActive,
//     required this.startDate,
//     required this.endDate,
//     required this.employeeId,
//     required this.salaryStructureCompanyId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.employeeDetailsId,
//     required this.employeeSalarySalaryStructureCompanyId,
//     required this.structure,
//     required this.monthlyEarning,
//     required this.employeeSalaryComponent,
//   });

//   dynamic id;
//   dynamic employmentType;
//   dynamic ctcValue;
//   bool isActive;
//   dynamic startDate;
//   dynamic endDate;
//   dynamic employeeId;
//   dynamic salaryStructureCompanyId;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic employeeDetailsId;
//   dynamic employeeSalarySalaryStructureCompanyId;
//   Structure? structure;
//   dynamic monthlyEarning;
//   List<EmployeeSalaryComponent>? employeeSalaryComponent;

//   factory EmployeeSalary.fromMap(Map<dynamic, dynamic> json) => EmployeeSalary(
//         id: json["id"] == null ? null : json["id"],
//         employmentType:
//             json["employmentType"] == null ? null : json["employmentType"],
//         ctcValue: json["ctcValue"] == null ? null : json["ctcValue"],
//         isActive: json["isActive"] == null ? null : json["isActive"],
//         startDate: json["startDate"] == null ? null : json["startDate"],
//         endDate: json["endDate"] == null ? null : json["endDate"],
//         employeeId: json["employeeId"] == null ? null : json["employeeId"],
//         salaryStructureCompanyId: json["salaryStructureCompanyId"] == null
//             ? null
//             : json["salaryStructureCompanyId"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//         employeeDetailsId: json["employee_details_id"] == null
//             ? null
//             : json["employee_details_id"],
//         employeeSalarySalaryStructureCompanyId:
//             json["salary_structure_company_id"] == null
//                 ? null
//                 : json["salary_structure_company_id"],
//         structure: json["structure"] == null
//             ? null
//             : Structure.fromMap(json["structure"]),
//         monthlyEarning: json["monthlyEarning"],
//         employeeSalaryComponent: json["employeeSalaryComponent"] == null
//             ? null
//             : List<EmployeeSalaryComponent>.from(json["employeeSalaryComponent"]
//                 .map((x) => EmployeeSalaryComponent.fromMap(x))),
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "employmentType": employmentType == null ? null : employmentType,
//         "ctcValue": ctcValue == null ? null : ctcValue,
//         "isActive": isActive == null ? null : isActive,
//         "startDate": startDate == null ? null : startDate,
//         "endDate": endDate == null ? null : endDate,
//         "employeeId": employeeId == null ? null : employeeId,
//         "salaryStructureCompanyId":
//             salaryStructureCompanyId == null ? null : salaryStructureCompanyId,
//         "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
//         "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
//         "employee_details_id":
//             employeeDetailsId == null ? null : employeeDetailsId,
//         "salary_structure_company_id":
//             employeeSalarySalaryStructureCompanyId == null
//                 ? null
//                 : employeeSalarySalaryStructureCompanyId,
//         "structure": structure == null ? null : structure?.toMap(),
//         "monthlyEarning": monthlyEarning,
//         "employeeSalaryComponent": employeeSalaryComponent == null
//             ? null
//             : List<dynamic>.from(
//                 employeeSalaryComponent!.map((x) => x.toMap())),
//       };
// }

// class EmployeeSalaryComponent {
//   EmployeeSalaryComponent({
//     required this.id,
//     required this.structureCompon,
//     required this.componentCode,
//     required this.salaryStructure,
//     required this.employeeSalaryI,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.employeeSalary,
//   });

//   dynamic id;
//   dynamic structureCompon;
//   dynamic componentCode;
//   dynamic salaryStructure;
//   dynamic employeeSalaryI;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic employeeSalary;

//   factory EmployeeSalaryComponent.fromMap(Map<dynamic, dynamic> json) =>
//       EmployeeSalaryComponent(
//         id: json["id"] == null ? null : json["id"],
//         structureCompon:
//             json["StructureCompon"] == null ? null : json["StructureCompon"],
//         componentCode:
//             json["componentCode"] == null ? null : json["componentCode"],
//         salaryStructure:
//             json["salaryStructure"] == null ? null : json["salaryStructure"],
//         employeeSalaryI:
//             json["employeeSalaryI"] == null ? null : json["employeeSalaryI"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//         employeeSalary:
//             json["employee_salary"] == null ? null : json["employee_salary"],
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "StructureCompon": structureCompon == null ? null : structureCompon,
//         "componentCode": componentCode == null ? null : componentCode,
//         "salaryStructure": salaryStructure == null ? null : salaryStructure,
//         "employeeSalaryI": employeeSalaryI == null ? null : employeeSalaryI,
//         "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
//         "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
//         "employee_salary": employeeSalary == null ? null : employeeSalary,
//       };
// }

// class Structure {
//   Structure({
//     required this.id,
//     required this.structureName,
//     required this.ctcGross,
//     required this.isPfApplicable,
//     required this.isPfApplicableAbove15,
//     required this.isPfCaelingApplicable,
//     required this.isEsicApplicable,
//     required this.isLwfApplicable,
//     required this.companyId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.component,
//   });

//   dynamic id;
//   dynamic structureName;
//   dynamic ctcGross;
//   bool isPfApplicable;
//   bool isPfApplicableAbove15;
//   bool isPfCaelingApplicable;
//   bool isEsicApplicable;
//   bool isLwfApplicable;
//   dynamic companyId;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   List<Component>? component;

//   factory Structure.fromMap(Map<dynamic, dynamic> json) => Structure(
//         id: json["id"] == null ? null : json["id"],
//         structureName:
//             json["structureName"] == null ? null : json["structureName"],
//         ctcGross: json["ctcGross"] == null ? null : json["ctcGross"],
//         isPfApplicable:
//             json["isPfApplicable"] == null ? null : json["isPfApplicable"],
//         isPfApplicableAbove15: json["isPfApplicableAbove15"] == null
//             ? null
//             : json["isPfApplicableAbove15"],
//         isPfCaelingApplicable: json["isPfCaelingApplicable"] == null
//             ? null
//             : json["isPfCaelingApplicable"],
//         isEsicApplicable:
//             json["isEsicApplicable"] == null ? null : json["isEsicApplicable"],
//         isLwfApplicable:
//             json["isLwfApplicable"] == null ? null : json["isLwfApplicable"],
//         companyId: json["companyId"] == null ? null : json["companyId"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//         component: json["component"] == null
//             ? null
//             : List<Component>.from(
//                 json["component"].map((x) => Component.fromMap(x))),
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "structureName": structureName == null ? null : structureName,
//         "ctcGross": ctcGross == null ? null : ctcGross,
//         "isPfApplicable": isPfApplicable == null ? null : isPfApplicable,
//         "isPfApplicableAbove15":
//             isPfApplicableAbove15 == null ? null : isPfApplicableAbove15,
//         "isPfCaelingApplicable":
//             isPfCaelingApplicable == null ? null : isPfCaelingApplicable,
//         "isEsicApplicable": isEsicApplicable == null ? null : isEsicApplicable,
//         "isLwfApplicable": isLwfApplicable == null ? null : isLwfApplicable,
//         "companyId": companyId == null ? null : companyId,
//         "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
//         "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
//         "component": component == null
//             ? null
//             : List<dynamic>.from(component!.map((x) => x.toMap())),
//       };
// }

// class Component {
//   Component({
//     required this.id,
//     required this.componentFormula,
//     required this.salaryComponentId,
//     required this.salaryStructureComp,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.salaryStructureCo,
//     required this.componentSalaryComponentId,
//     required this.defaultComponent,
//   });

//   dynamic id;
//   dynamic componentFormula;
//   dynamic salaryComponentId;
//   dynamic salaryStructureComp;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic salaryStructureCo;
//   dynamic componentSalaryComponentId;
//   DefaultComponent? defaultComponent;

//   factory Component.fromMap(Map<dynamic, dynamic> json) => Component(
//         id: json["id"] == null ? null : json["id"],
//         componentFormula:
//             json["componentFormula"] == null ? null : json["componentFormula"],
//         salaryComponentId: json["salaryComponentId"] == null
//             ? null
//             : json["salaryComponentId"],
//         salaryStructureComp: json["salaryStructureComp"] == null
//             ? null
//             : json["salaryStructureComp"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//         salaryStructureCo: json["salary_structure_co"] == null
//             ? null
//             : json["salary_structure_co"],
//         componentSalaryComponentId: json["salary_component_id"] == null
//             ? null
//             : json["salary_component_id"],
//         defaultComponent: json["defaultComponent"] == null
//             ? null
//             : DefaultComponent.fromMap(json["defaultComponent"]),
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "componentFormula": componentFormula == null ? null : componentFormula,
//         "salaryComponentId":
//             salaryComponentId == null ? null : salaryComponentId,
//         "salaryStructureComp":
//             salaryStructureComp == null ? null : salaryStructureComp,
//         "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
//         "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
//         "salary_structure_co":
//             salaryStructureCo == null ? null : salaryStructureCo,
//         "salary_component_id": componentSalaryComponentId == null
//             ? null
//             : componentSalaryComponentId,
//         "defaultComponent":
//             defaultComponent == null ? null : defaultComponent?.toMap(),
//       };
// }

// class DefaultComponent {
//   DefaultComponent({
//     required this.id,
//     required this.co,
//     required this.de,
//     required this.defaultComponentIs,
//     required this.va,
//     required this.ap,
//     required this.cr,
//     required this.up,
//   });

//   dynamic id;
//   dynamic co;
//   dynamic de;
//   bool defaultComponentIs;
//   dynamic va;
//   dynamic ap;
//   DateTime? cr;
//   DateTime? up;

//   factory DefaultComponent.fromMap(Map<dynamic, dynamic> json) =>
//       DefaultComponent(
//         id: json["id"] == null ? null : json["id"],
//         co: json["co"] == null ? null : json["co"],
//         de: json["de"] == null ? null : json["de"],
//         defaultComponentIs: json["is"] == null ? null : json["is"],
//         va: json["va"] == null ? null : json["va"],
//         ap: json["ap"] == null ? null : json["ap"],
//         cr: json["cr"] == null ? null : DateTime.parse(json["cr"]),
//         up: json["up"] == null ? null : DateTime.parse(json["up"]),
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "co": co == null ? null : co,
//         "de": de == null ? null : de,
//         "is": defaultComponentIs == null ? null : defaultComponentIs,
//         "va": va == null ? null : va,
//         "ap": ap == null ? null : ap,
//         "cr": cr == null ? null : cr?.toIso8601String(),
//         "up": up == null ? null : up?.toIso8601String(),
//       };
// }

// class Finance {
//   Finance({
//     required this.id,
//     required this.accountHolderName,
//     required this.accountNumber,
//     required this.ifscCode,
//     required this.bankName,
//     required this.accountType,
//     required this.branchName,
//     required this.cancelledChequePath,
//     required this.swiftCode,
//     required this.entityId,
//     required this.employeeId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.financeEmployeeId,
//     required this.financeEntityId,
//   });

//   dynamic id;
//   dynamic accountHolderName;
//   dynamic accountNumber;
//   dynamic ifscCode;
//   dynamic bankName;
//   dynamic accountType;
//   dynamic branchName;
//   dynamic cancelledChequePath;
//   dynamic swiftCode;
//   dynamic entityId;
//   dynamic employeeId;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic financeEmployeeId;
//   dynamic financeEntityId;

//   factory Finance.fromMap(Map<dynamic, dynamic> json) => Finance(
//         id: json["id"] == null ? null : json["id"],
//         accountHolderName: json["accountHolderName"] == null
//             ? null
//             : json["accountHolderName"],
//         accountNumber:
//             json["accountNumber"] == null ? null : json["accountNumber"],
//         ifscCode: json["ifscCode"] == null ? null : json["ifscCode"],
//         bankName: json["bankName"] == null ? null : json["bankName"],
//         accountType: json["accountType"] == null ? null : json["accountType"],
//         branchName: json["branchName"] == null ? null : json["branchName"],
//         cancelledChequePath: json["cancelledChequePath"] == null
//             ? null
//             : json["cancelledChequePath"],
//         swiftCode: json["swiftCode"] == null ? null : json["swiftCode"],
//         entityId: json["entityId"],
//         employeeId: json["employeeId"] == null ? null : json["employeeId"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//         financeEmployeeId:
//             json["employee_id"] == null ? null : json["employee_id"],
//         financeEntityId: json["entity_id"],
//       );

//   Map<dynamic, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "accountHolderName":
//             accountHolderName == null ? null : accountHolderName,
//         "accountNumber": accountNumber == null ? null : accountNumber,
//         "ifscCode": ifscCode == null ? null : ifscCode,
//         "bankName": bankName == null ? null : bankName,
//         "accountType": accountType == null ? null : accountType,
//         "branchName": branchName == null ? null : branchName,
//         "cancelledChequePath":
//             cancelledChequePath == null ? null : cancelledChequePath,
//         "swiftCode": swiftCode == null ? null : swiftCode,
//         "entityId": entityId,
//         "employeeId": employeeId == null ? null : employeeId,
//         "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
//         "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
//         "employee_id": financeEmployeeId == null ? null : financeEmployeeId,
//         "entity_id": financeEntityId,
//       };
// }

UserModel userModelFromMap(dynamic str) => UserModel.fromJson(json.decode(str));

dynamic userModelToMap(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserData? userData;
  String? token;

  UserModel({
    this.userData,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userData = (json['userData'] as Map<String, dynamic>?) != null
        ? UserData.fromJson(json['userData'] as Map<String, dynamic>)
        : null;
    token = json['token'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['userData'] = userData?.toJson();
    json['token'] = token;
    return json;
  }
}

class UserData {
  String? fullName;
  int? id;
  String? email;
  String? mobile;
  String? password;
  String? firstName;
  String? lastName;
  String? token;
  String? userType;
  dynamic createdBy;
  dynamic updatedBy;
  List<dynamic>? contact;
  Employee? employee;
  dynamic company;

  UserData({
    this.fullName,
    this.id,
    this.email,
    this.mobile,
    this.password,
    this.firstName,
    this.lastName,
    this.token,
    this.userType,
    this.createdBy,
    this.updatedBy,
    this.contact,
    this.employee,
    this.company,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'] as String?;
    id = json['id'] as int?;
    email = json['email'] as String?;
    mobile = json['mobile'] as String?;
    password = json['password'] as String?;
    firstName = json['firstName'] as String?;
    lastName = json['lastName'] as String?;
    token = json['token'] as String?;
    userType = json['userType'] as String?;
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    contact = json['contact'] as List?;
    employee = (json['employee'] as Map<String, dynamic>?) != null
        ? Employee.fromJson(json['employee'] as Map<String, dynamic>)
        : null;
    company = json['company'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['fullName'] = fullName;
    json['id'] = id;
    json['email'] = email;
    json['mobile'] = mobile;
    json['password'] = password;
    json['firstName'] = firstName;
    json['lastName'] = lastName;
    json['token'] = token;
    json['userType'] = userType;
    json['createdBy'] = createdBy;
    json['updatedBy'] = updatedBy;
    json['contact'] = contact;
    json['employee'] = employee?.toJson();
    json['company'] = company;
    return json;
  }
}

class Employee {
  String? employeeCode;
  int? id;
  String? education;
  dynamic fatherName;
  dynamic motherName;
  dynamic dateOfBirth;
  String? gender;
  String? employmentType;
  String? bloodGroup;
  String? nomineeName;
  String? nomineeRelation;
  String? emergencyContact;
  String? onRollEmployeeCode;
  String? offRollEmployeeCode;
  int? onRollEntityId;
  int? offRollEntityId;
  int? userId;
  dynamic employeeOnrollment;
  EmployeeOffrollment? employeeOffrollment;
  List<Addresses>? addresses;
  List<Documents>? documents;
  Finance? finance;
  EmployeeSalary? employeeSalary;

  Employee({
    this.employeeCode,
    this.id,
    this.education,
    this.fatherName,
    this.motherName,
    this.dateOfBirth,
    this.gender,
    this.employmentType,
    this.bloodGroup,
    this.nomineeName,
    this.nomineeRelation,
    this.emergencyContact,
    this.onRollEmployeeCode,
    this.offRollEmployeeCode,
    this.onRollEntityId,
    this.offRollEntityId,
    this.userId,
    this.employeeOnrollment,
    this.employeeOffrollment,
    this.addresses,
    this.documents,
    this.finance,
    this.employeeSalary,
  });

  Employee.fromJson(Map<String, dynamic> json) {
    employeeCode = json['employeeCode'] as String?;
    id = json['id'] as int?;
    education = json['education'] as String?;
    fatherName = json['fatherName'];
    motherName = json['motherName'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'] as String?;
    employmentType = json['employmentType'] as String?;
    bloodGroup = json['bloodGroup'] as String?;
    nomineeName = json['nomineeName'] as String?;
    nomineeRelation = json['nomineeRelation'] as String?;
    emergencyContact = json['emergencyContact'] as String?;
    onRollEmployeeCode = json['onRollEmployeeCode'] as String?;
    offRollEmployeeCode = json['offRollEmployeeCode'] as String?;
    onRollEntityId = json['onRollEntityId'] as int?;
    offRollEntityId = json['offRollEntityId'] as int?;
    userId = json['userId'] as int?;
    employeeOnrollment = json['employeeOnrollment'];
    employeeOffrollment =
        (json['employeeOffrollment'] as Map<String, dynamic>?) != null
            ? EmployeeOffrollment.fromJson(
                json['employeeOffrollment'] as Map<String, dynamic>)
            : null;
    addresses = (json['addresses'] as List?)
        ?.map((dynamic e) => Addresses.fromJson(e as Map<String, dynamic>))
        .toList();
    documents = (json['documents'] as List?)
        ?.map((dynamic e) => Documents.fromJson(e as Map<String, dynamic>))
        .toList();
    finance = (json['finance'] as Map<String, dynamic>?) != null
        ? Finance.fromJson(json['finance'] as Map<String, dynamic>)
        : null;
    employeeSalary = (json['employeeSalary'] as Map<String, dynamic>?) != null
        ? EmployeeSalary.fromJson(
            json['employeeSalary'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['employeeCode'] = employeeCode;
    json['id'] = id;
    json['education'] = education;
    json['fatherName'] = fatherName;
    json['motherName'] = motherName;
    json['dateOfBirth'] = dateOfBirth;
    json['gender'] = gender;
    json['employmentType'] = employmentType;
    json['bloodGroup'] = bloodGroup;
    json['nomineeName'] = nomineeName;
    json['nomineeRelation'] = nomineeRelation;
    json['emergencyContact'] = emergencyContact;
    json['onRollEmployeeCode'] = onRollEmployeeCode;
    json['offRollEmployeeCode'] = offRollEmployeeCode;
    json['onRollEntityId'] = onRollEntityId;
    json['offRollEntityId'] = offRollEntityId;
    json['userId'] = userId;
    json['employeeOnrollment'] = employeeOnrollment;
    json['employeeOffrollment'] = employeeOffrollment?.toJson();
    json['addresses'] = addresses?.map((e) => e.toJson()).toList();
    json['documents'] = documents?.map((e) => e.toJson()).toList();
    json['finance'] = finance?.toJson();
    json['employeeSalary'] = employeeSalary?.toJson();
    return json;
  }
}

class EmployeeOffrollment {
  int? id;
  dynamic userRoles;
  String? designation;
  String? department;
  String? joiningDate;
  dynamic thisRoleStartDate;
  dynamic lastWorkingDate;
  dynamic isActive;
  int? assignedLocationId;
  dynamic employeeCode;
  int? onRollEntityId;
  int? offRollEntityId;
  dynamic employeeSalaryId;
  int? employeeDetailId;
  OffRollCompany? offRollCompany;

  EmployeeOffrollment({
    this.id,
    this.userRoles,
    this.designation,
    this.department,
    this.joiningDate,
    this.thisRoleStartDate,
    this.lastWorkingDate,
    this.isActive,
    this.assignedLocationId,
    this.employeeCode,
    this.onRollEntityId,
    this.offRollEntityId,
    this.employeeSalaryId,
    this.employeeDetailId,
    this.offRollCompany,
  });

  EmployeeOffrollment.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    userRoles = json['userRoles'];
    designation = json['designation'] as String?;
    department = json['department'] as String?;
    joiningDate = json['joiningDate'] as String?;
    thisRoleStartDate = json['thisRoleStartDate'];
    lastWorkingDate = json['lastWorkingDate'];
    isActive = json['isActive'];
    assignedLocationId = json['assignedLocationId'] as int?;
    employeeCode = json['employeeCode'];
    onRollEntityId = json['onRollEntityId'] as int?;
    offRollEntityId = json['offRollEntityId'] as int?;
    employeeSalaryId = json['employeeSalaryId'];
    employeeDetailId = json['employeeDetailId'] as int?;
    offRollCompany = (json['offRollCompany'] as Map<String, dynamic>?) != null
        ? OffRollCompany.fromJson(
            json['offRollCompany'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['userRoles'] = userRoles;
    json['designation'] = designation;
    json['department'] = department;
    json['joiningDate'] = joiningDate;
    json['thisRoleStartDate'] = thisRoleStartDate;
    json['lastWorkingDate'] = lastWorkingDate;
    json['isActive'] = isActive;
    json['assignedLocationId'] = assignedLocationId;
    json['employeeCode'] = employeeCode;
    json['onRollEntityId'] = onRollEntityId;
    json['offRollEntityId'] = offRollEntityId;
    json['employeeSalaryId'] = employeeSalaryId;
    json['employeeDetailId'] = employeeDetailId;
    json['offRollCompany'] = offRollCompany?.toJson();
    return json;
  }
}

class OffRollCompany {
  int? id;
  String? name;
  String? cinNum;
  String? legalStatus;
  String? natureOfBusiness;
  String? email;
  dynamic tanNum;
  dynamic linNum;
  int? primaryUserId;
  bool? isVendor;
  bool? isClient;
  bool? isGroupEntity;
  dynamic parentEntityId;

  OffRollCompany({
    this.id,
    this.name,
    this.cinNum,
    this.legalStatus,
    this.natureOfBusiness,
    this.email,
    this.tanNum,
    this.linNum,
    this.primaryUserId,
    this.isVendor,
    this.isClient,
    this.isGroupEntity,
    this.parentEntityId,
  });

  OffRollCompany.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    cinNum = json['cinNum'] as String?;
    legalStatus = json['legalStatus'] as String?;
    natureOfBusiness = json['natureOfBusiness'] as String?;
    email = json['email'] as String?;
    tanNum = json['tanNum'];
    linNum = json['linNum'];
    primaryUserId = json['primaryUserId'] as int?;
    isVendor = json['isVendor'] as bool?;
    isClient = json['isClient'] as bool?;
    isGroupEntity = json['isGroupEntity'] as bool?;
    parentEntityId = json['parentEntityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['cinNum'] = cinNum;
    json['legalStatus'] = legalStatus;
    json['natureOfBusiness'] = natureOfBusiness;
    json['email'] = email;
    json['tanNum'] = tanNum;
    json['linNum'] = linNum;
    json['primaryUserId'] = primaryUserId;
    json['isVendor'] = isVendor;
    json['isClient'] = isClient;
    json['isGroupEntity'] = isGroupEntity;
    json['parentEntityId'] = parentEntityId;
    return json;
  }
}

class Addresses {
  int? id;
  String? addressLine1;
  String? addressLine2;
  dynamic countryId;
  int? stateId;
  int? cityId;
  String? pincode;
  String? landmark;
  String? addressType;
  int? employeeId;
  UserState? state;
  City? city;

  Addresses({
    this.id,
    this.addressLine1,
    this.addressLine2,
    this.countryId,
    this.stateId,
    this.cityId,
    this.pincode,
    this.landmark,
    this.addressType,
    this.employeeId,
    this.state,
    this.city,
  });

  Addresses.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    addressLine1 = json['addressLine1'] as String?;
    addressLine2 = json['addressLine2'] as String?;
    countryId = json['countryId'];
    stateId = json['stateId'] as int?;
    cityId = json['cityId'] as int?;
    pincode = json['pincode'] as String?;
    landmark = json['landmark'] as String?;
    addressType = json['addressType'] as String?;
    employeeId = json['employeeId'] as int?;
    state = (json['state'] as Map<String, dynamic>?) != null
        ? UserState.fromJson(json['state'] as Map<String, dynamic>)
        : null;
    city = (json['city'] as Map<String, dynamic>?) != null
        ? City.fromJson(json['city'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['addressLine1'] = addressLine1;
    json['addressLine2'] = addressLine2;
    json['countryId'] = countryId;
    json['stateId'] = stateId;
    json['cityId'] = cityId;
    json['pincode'] = pincode;
    json['landmark'] = landmark;
    json['addressType'] = addressType;
    json['employeeId'] = employeeId;
    json['state'] = state?.toJson();
    json['city'] = city?.toJson();
    return json;
  }
}

class UserState {
  int? id;
  String? name;
  int? countryId;

  UserState({
    this.id,
    this.name,
    this.countryId,
  });

  UserState.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    countryId = json['countryId'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['countryId'] = countryId;
    return json;
  }
}

class City {
  int? id;
  String? name;
  String? cityCode;
  int? stateId;

  City({
    this.id,
    this.name,
    this.cityCode,
    this.stateId,
  });

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    cityCode = json['cityCode'] as String?;
    stateId = json['stateId'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['cityCode'] = cityCode;
    json['stateId'] = stateId;
    return json;
  }
}

class Documents {
  int? id;
  String? documentName;
  String? documentValue;
  dynamic documentExpiry;
  String? documentFrontPath;
  dynamic documentBackPath;
  bool? isMandatory;
  bool? isVerified;
  dynamic vendorEntityId;
  int? documentTypeId;
  int? employeeId;
  DocumentType? documentType;

  Documents({
    this.id,
    this.documentName,
    this.documentValue,
    this.documentExpiry,
    this.documentFrontPath,
    this.documentBackPath,
    this.isMandatory,
    this.isVerified,
    this.vendorEntityId,
    this.documentTypeId,
    this.employeeId,
    this.documentType,
  });

  Documents.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    documentName = json['documentName'] as String?;
    documentValue = json['documentValue'] as String?;
    documentExpiry = json['documentExpiry'];
    documentFrontPath = json['documentFrontPath'] as String?;
    documentBackPath = json['documentBackPath'];
    isMandatory = json['isMandatory'] as bool?;
    isVerified = json['isVerified'] as bool?;
    vendorEntityId = json['vendorEntityId'];
    documentTypeId = json['documentTypeId'] as int?;
    employeeId = json['employeeId'] as int?;
    documentType = (json['DocumentType'] as Map<String, dynamic>?) != null
        ? DocumentType.fromJson(json['DocumentType'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['documentName'] = documentName;
    json['documentValue'] = documentValue;
    json['documentExpiry'] = documentExpiry;
    json['documentFrontPath'] = documentFrontPath;
    json['documentBackPath'] = documentBackPath;
    json['isMandatory'] = isMandatory;
    json['isVerified'] = isVerified;
    json['vendorEntityId'] = vendorEntityId;
    json['documentTypeId'] = documentTypeId;
    json['employeeId'] = employeeId;
    json['DocumentType'] = documentType?.toJson();
    return json;
  }
}

class DocumentType {
  int? id;
  String? documentName;
  String? documentKey;
  bool? documentHasExpiry;
  bool? documentHasBack;
  bool? validCountryId;
  bool? isVendor;
  bool? isCompany;
  bool? isEmployee;

  DocumentType({
    this.id,
    this.documentName,
    this.documentKey,
    this.documentHasExpiry,
    this.documentHasBack,
    this.validCountryId,
    this.isVendor,
    this.isCompany,
    this.isEmployee,
  });

  DocumentType.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    documentName = json['documentName'] as String?;
    documentKey = json['documentKey'] as String?;
    documentHasExpiry = json['documentHasExpiry'] as bool?;
    documentHasBack = json['documentHasBack'] as bool?;
    validCountryId = json['validCountryId'] as bool?;
    isVendor = json['isVendor'] as bool?;
    isCompany = json['isCompany'] as bool?;
    isEmployee = json['isEmployee'] as bool?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['documentName'] = documentName;
    json['documentKey'] = documentKey;
    json['documentHasExpiry'] = documentHasExpiry;
    json['documentHasBack'] = documentHasBack;
    json['validCountryId'] = validCountryId;
    json['isVendor'] = isVendor;
    json['isCompany'] = isCompany;
    json['isEmployee'] = isEmployee;
    return json;
  }
}

class Finance {
  int? id;
  String? accountHolderName;
  String? accountNumber;
  String? ifscCode;
  String? bankName;
  String? accountType;
  String? branchName;
  String? cancelledChequePath;
  String? swiftCode;
  dynamic entityId;
  int? employeeId;

  Finance({
    this.id,
    this.accountHolderName,
    this.accountNumber,
    this.ifscCode,
    this.bankName,
    this.accountType,
    this.branchName,
    this.cancelledChequePath,
    this.swiftCode,
    this.entityId,
    this.employeeId,
  });

  Finance.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    accountHolderName = json['accountHolderName'] as String?;
    accountNumber = json['accountNumber'] as String?;
    ifscCode = json['ifscCode'] as String?;
    bankName = json['bankName'] as String?;
    accountType = json['accountType'] as String?;
    branchName = json['branchName'] as String?;
    cancelledChequePath = json['cancelledChequePath'] as String?;
    swiftCode = json['swiftCode'] as String?;
    entityId = json['entityId'];
    employeeId = json['employeeId'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['accountHolderName'] = accountHolderName;
    json['accountNumber'] = accountNumber;
    json['ifscCode'] = ifscCode;
    json['bankName'] = bankName;
    json['accountType'] = accountType;
    json['branchName'] = branchName;
    json['cancelledChequePath'] = cancelledChequePath;
    json['swiftCode'] = swiftCode;
    json['entityId'] = entityId;
    json['employeeId'] = employeeId;
    return json;
  }
}

class EmployeeSalary {
  int? id;
  String? employmentType;
  String? ctcValue;
  bool? isActive;
  String? startDate;
  String? endDate;
  int? employeeId;
  int? salaryStructureCompanyId;
  int? employeeDetailsId;
  Structure? structure;
  MonthlyEarning? monthlyEarning;
  List<dynamic>? employeeSalaryComponent;

  EmployeeSalary({
    this.id,
    this.employmentType,
    this.ctcValue,
    this.isActive,
    this.startDate,
    this.endDate,
    this.employeeId,
    this.salaryStructureCompanyId,
    this.employeeDetailsId,
    this.structure,
    this.monthlyEarning,
    this.employeeSalaryComponent,
  });

  EmployeeSalary.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    employmentType = json['employmentType'] as String?;
    ctcValue = json['ctcValue'] as String?;
    isActive = json['isActive'] as bool?;
    startDate = json['startDate'] as String?;
    endDate = json['endDate'] as String?;
    employeeId = json['employeeId'] as int?;
    salaryStructureCompanyId = json['salaryStructureCompanyId'] as int?;
    employeeDetailsId = json['employee_details_id'] as int?;
    salaryStructureCompanyId = json['salary_structure_company_id'] as int?;
    structure = (json['structure'] as Map<String, dynamic>?) != null
        ? Structure.fromJson(json['structure'] as Map<String, dynamic>)
        : null;
    monthlyEarning = (json['monthlyEarning'] as Map<String, dynamic>?) != null
        ? MonthlyEarning.fromJson(
            json['monthlyEarning'] as Map<String, dynamic>)
        : null;
    employeeSalaryComponent = json['employeeSalaryComponent'] as List?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['employmentType'] = employmentType;
    json['ctcValue'] = ctcValue;
    json['isActive'] = isActive;
    json['startDate'] = startDate;
    json['endDate'] = endDate;
    json['employeeId'] = employeeId;
    json['salaryStructureCompanyId'] = salaryStructureCompanyId;
    json['employee_details_id'] = employeeDetailsId;
    json['salary_structure_company_id'] = salaryStructureCompanyId;
    json['structure'] = structure?.toJson();
    json['monthlyEarning'] = monthlyEarning?.toJson();
    json['employeeSalaryComponent'] = employeeSalaryComponent;
    return json;
  }
}

class Structure {
  int? id;
  String? structureName;
  String? ctcGross;
  bool? isPfApplicable;
  bool? isPfApplicableAbove15;
  bool? isPfCaelingApplicable;
  bool? isEsicApplicable;
  bool? isLwfApplicable;
  int? companyId;

  Structure({
    this.id,
    this.structureName,
    this.ctcGross,
    this.isPfApplicable,
    this.isPfApplicableAbove15,
    this.isPfCaelingApplicable,
    this.isEsicApplicable,
    this.isLwfApplicable,
    this.companyId,
  });

  Structure.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    structureName = json['structureName'] as String?;
    ctcGross = json['ctcGross'] as String?;
    isPfApplicable = json['isPfApplicable'] as bool?;
    isPfApplicableAbove15 = json['isPfApplicableAbove15'] as bool?;
    isPfCaelingApplicable = json['isPfCaelingApplicable'] as bool?;
    isEsicApplicable = json['isEsicApplicable'] as bool?;
    isLwfApplicable = json['isLwfApplicable'] as bool?;
    companyId = json['companyId'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['structureName'] = structureName;
    json['ctcGross'] = ctcGross;
    json['isPfApplicable'] = isPfApplicable;
    json['isPfApplicableAbove15'] = isPfApplicableAbove15;
    json['isPfCaelingApplicable'] = isPfCaelingApplicable;
    json['isEsicApplicable'] = isEsicApplicable;
    json['isLwfApplicable'] = isLwfApplicable;
    json['companyId'] = companyId;
    return json;
  }
}

class MonthlyEarning {
  int? id;
  dynamic totalSalaryRelease;
  String? salaryMonth;
  String? salaryYear;
  String? releaseDate;
  String? presentDays;
  String? payableDays;
  String? absentDays;
  String? tDS;
  String? status;
  int? employeeSalaryId;

  MonthlyEarning({
    this.id,
    this.totalSalaryRelease,
    this.salaryMonth,
    this.salaryYear,
    this.releaseDate,
    this.presentDays,
    this.payableDays,
    this.absentDays,
    this.tDS,
    this.status,
    this.employeeSalaryId,
  });

  MonthlyEarning.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    totalSalaryRelease = json['totalSalaryRelease'];
    salaryMonth = json['salaryMonth'] as String?;
    salaryYear = json['salaryYear'] as String?;
    releaseDate = json['releaseDate'] as String?;
    presentDays = json['presentDays'] as String?;
    payableDays = json['payableDays'] as String?;
    absentDays = json['absentDays'] as String?;
    tDS = json['TDS'] as String?;
    status = json['status'] as String?;
    employeeSalaryId = json['employeeSalaryId'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['totalSalaryRelease'] = totalSalaryRelease;
    json['salaryMonth'] = salaryMonth;
    json['salaryYear'] = salaryYear;
    json['releaseDate'] = releaseDate;
    json['presentDays'] = presentDays;
    json['payableDays'] = payableDays;
    json['absentDays'] = absentDays;
    json['TDS'] = tDS;
    json['status'] = status;
    json['employeeSalaryId'] = employeeSalaryId;
    return json;
  }
}
