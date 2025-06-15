import Fakerator from 'fakerator';

const fakerator = Fakerator();

export default class Randomizer {
  static randomValueFromArray(array) {
    return array[Math.floor(Math.random() * array.length)];
  }

  static randomValueFromObject(obj) {
    return Object.values(obj)[Math.floor(Math.random() * Object.keys(obj).length)];
  }

  static randomKeyFromObject(obj) {
    return Object.keys(obj)[Math.floor(Math.random() * Object.keys(obj).length)];
  }

  static getKeyByValue(obj, value) {
    return Object.keys(obj).find(key => obj[key] === value);
  }

  static getRandomString(length) {
    return fakerator.random.string(length);
  }

  static getRandomNumber(minNumber, maxNumber) {
    return fakerator.random.number(minNumber, maxNumber);
  }

  static randomKeyAndValueFromObject(obj) {
    const randomNumber = Math.floor(Math.random() * Object.keys(obj).length);
    return {
      objKey: Object.keys(obj)[randomNumber],
      objValue: Object.values(obj)[randomNumber],
    };
  }
}
