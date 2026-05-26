"use strict";
/**
 * Cloud Functions for Cloud Assist.
 * This file serves as the entry point, exporting all handlers from
 * modular files.
 */
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __exportStar = (this && this.__exportStar) || function(m, exports) {
    for (var p in m) if (p !== "default" && !Object.prototype.hasOwnProperty.call(exports, p)) __createBinding(exports, m, p);
};
Object.defineProperty(exports, "__esModule", { value: true });
// User Handlers
__exportStar(require("./handlers/users"), exports);
// AI Content Handlers
__exportStar(require("./handlers/ai_content"), exports);
// Data Fetchers
__exportStar(require("./handlers/data_fetchers"), exports);
// Maintenance Handlers
__exportStar(require("./handlers/maintenance"), exports);
// Scheduled Automation
__exportStar(require("./handlers/scheduled"), exports);
//# sourceMappingURL=index.js.map