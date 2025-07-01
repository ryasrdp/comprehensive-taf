// src/helpers/UserCreator.js
import Fakerator from 'fakerator';
import DataStorage from './DataStorage.js';
import { Randomizer } from './index.js';
import data from '../../config/constants.js';
import { format } from 'date-fns';

const fakerator = Fakerator();

export default class UserCreator {
  static createUser(options = {}) {
    const genders = ['Male', 'Female', 'Other', 'Non-binary'];
    const randomIndex = fakerator.random.number(0, 3);
    const firstName = fakerator.names.firstName();
    const lastName = fakerator.names.lastName();
    const userEmail = fakerator.internet.email();

    return {
      firstName: firstName,
      lastName: lastName,
      email: userEmail,
      confirmEmail: userEmail,
      userName: `${firstName} ${lastName}`,
      userAddress: `${fakerator.address.country()}, ${fakerator.address.city()}, ${fakerator.address.countryCode()}`,
      addressAnother: options.addressAnother || `${fakerator.address.street()}`,
      passw: `${fakerator.random.number(0, 999999)}_$%_${fakerator.names.firstName()}`,
      phoneNumber: `+${fakerator.random.number(1000000000, 9999999999)}`,
      emergencyContactPhone: `+${fakerator.random.number(1000000000, 9999999999)}`,
      gender: genders[randomIndex],
      userPlanet: Randomizer.randomValueFromArray(data.planets),
      city: fakerator.address.city(),
      state: fakerator.address.countryCode(),
      userCountry: Randomizer.randomValueFromArray(data.countries),
      userEmploymentStatus: Randomizer.randomValueFromArray(data.employmentStatus),
      userEducation: Randomizer.randomValueFromArray(data.educationLevel),
      userDob: format(fakerator.date.between(new Date('1970-01-01'), new Date('1990-01-01')), 'MM/dd/yyyy'),
      emergencyContactName: fakerator.names.firstName(),
      userRace: Randomizer.randomValueFromArray(data.races),
      userSolarSystem: Randomizer.randomValueFromArray(data.solarSystem),
      postalCode: fakerator.address.postCode(),
      ...options,
    };
  }

  static addUser(userName, userNumber, options = {}) {
    const userData = UserCreator.createUser(options);
    DataStorage.setNamespace(userName, userNumber, userData);
  }

  static getUser(userName, userNumber) {
    return DataStorage.getNamespace(userName, userNumber);
  }
}
