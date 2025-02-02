import { expect } from "chai";
import getTime from "../src/time-service.js"

describe('Service', (): void => {
    it('When time is requested then formatted time is properly returned with hours, mins and seconds in ISO format', async (): Promise<void> => {
        const retVal = getTime();
        expect(retVal.length).eq(24);
    })
})