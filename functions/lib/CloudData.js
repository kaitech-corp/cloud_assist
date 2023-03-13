"use strict";
/* eslint-disable max-len */
/* eslint-disable require-jsdoc */
/**
 * Represents cloud data.
 *
 * @typedef {Object} CloudData
 * @property {string} service - The name of the cloud service.
 * @property {string} description - A brief description of the cloud service.
 * @property {string} detail - A detailed description of the cloud service.
 * @property {string} link - A link to the cloud service documentation.
 * @property {Array.<string>} benefits - An array of benefits of the cloud service.
 * @property {Array.<string>} cons - An array of cons of the cloud service.
 * @property {Array.<string>} useCases - An array of use cases for the cloud service.
 * @property {string} example - An example of how the cloud service can be used.
 */
Object.defineProperty(exports, "__esModule", { value: true });
exports.CloudData = void 0;
/**
 * Creates a new CloudData object.
 *
 * @param {string} service - The name of the cloud service.
 * @param {string} description - A brief description of the cloud service.
 * @param {string} detail - A detailed description of the cloud service.
 * @param {string} link - A link to the cloud service documentation.
 * @param {Array.<string>} benefits - An array of benefits of the cloud service.
 * @param {Array.<string>} cons - An array of cons of the cloud service.
 * @param {Array.<string>} useCases - An array of use cases for the cloud service.
 * @param {string} example - An example of how the cloud service can be used.
 */
/* eslint-disable max-len */
/**
 * Represents cloud data.
 *
 * @typedef {Object} CloudData
 * @property {string} service - The name of the cloud service.
 * @property {string} description - A brief description of the cloud service.
 * @property {string} detail - A detailed description of the cloud service.
 * @property {string} link - A link to the cloud service documentation.
 * @property {Array.<string>} benefits - An array of benefits of the cloud service.
 * @property {Array.<string>} cons - An array of cons of the cloud service.
 * @property {Array.<string>} useCases - An array of use cases for the cloud service.
 * @property {string} example - An example of how the cloud service can be used.
 */
/**
 * Creates a new CloudData object.
 *
 * @param {string} service - The name of the cloud service.
 * @param {string} description - A brief description of the cloud service.
 * @param {string} detail - A detailed description of the cloud service.
 * @param {string} link - A link to the cloud service documentation.
 * @param {Array.<string>} benefits - An array of benefits of the cloud service.
 * @param {Array.<string>} cons - An array of cons of the cloud service.
 * @param {Array.<string>} useCases - An array of use cases for the cloud service.
 * @param {string} example - An example of how the cloud service can be used.
 */
class CloudData {
    constructor(service, description, detail, link, benefits, cons, useCases, example) {
        this.service = service;
        this.description = description;
        this.detail = detail;
        this.link = link;
        this.benefits = benefits;
        this.cons = cons;
        this.useCases = useCases;
        this.example = example;
    }
    /**
     * Creates a new CloudData object from a JSON object.
     *
     * @param {Object} json - The JSON object representing the cloud data.
     * @return {CloudData} A new CloudData object.
     */
    static fromJson(json) {
        return new CloudData(json.service, json.description, json.detail, json.link, json.benefits, json.cons, json.useCases, json.example);
    }
}
exports.CloudData = CloudData;
//# sourceMappingURL=CloudData.js.map