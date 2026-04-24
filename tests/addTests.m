classdef addTests < matlab.unittest.TestCase
    methods (Test)
        function addWorks(testCase)
            testCase.verifyEqual(add(2, 2), 4);
        end

        function addWorkswithNegatives(testCase)
            testCase.verifyEqual(add(2, -1), 1);
        end
        function addWorksWithDecimals(testCase)
            testCase.verifyEqual(add(0.3, 1.5), 1.8);
        end
    end
end