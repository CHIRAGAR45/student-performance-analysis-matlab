clc;
clear;
close all;

% Student marks: columns are Mathematics, Programming and DBMS
marks = [
    78 82 75;
    65 70 68;
    88 91 85;
    72 75 70;
    95 89 92;
    60 64 62;
    84 86 80;
    70 73 76;
    90 94 88;
    68 66 71
];

attendance = [85 72 94 78 97 65 88 75 92 70];
examMarks = [80 69 89 74 93 63 85 72 91 68];

% Statistical calculations
meanMarks = mean(marks);
medianMarks = median(marks);
modeMarks = mode(marks);
rangeMarks = max(marks) - min(marks);
varianceMarks = var(marks);
standardDeviation = std(marks);

disp('===== STATISTICAL ANALYSIS =====');
disp('Mean Marks:'); disp(meanMarks);
disp('Median Marks:'); disp(medianMarks);
disp('Mode Marks:'); disp(modeMarks);
disp('Range of Marks:'); disp(rangeMarks);
disp('Variance:'); disp(varianceMarks);
disp('Standard Deviation:'); disp(standardDeviation);

% Correlation
correlationMatrix = corrcoef(attendance, examMarks);
correlation = correlationMatrix(1,2);
disp('===== CORRELATION ANALYSIS =====');
fprintf('Correlation coefficient = %.4f\n', correlation);

% Linear regression and prediction
regressionCoefficients = polyfit(attendance, examMarks, 1);
slope = regressionCoefficients(1);
intercept = regressionCoefficients(2);
disp('===== LINEAR REGRESSION =====');
fprintf('Exam Marks = %.4f * Attendance + %.4f\n', slope, intercept);

predictedMarks = polyval(regressionCoefficients, 90);
fprintf('Predicted marks for 90%% attendance = %.2f\n', predictedMarks);

% Two-sample t-test
group1 = examMarks(1:5);
group2 = examMarks(6:10);
[h, pValue] = ttest2(group1, group2);

disp('===== T-TEST =====');
fprintf('Group 1 Mean = %.2f\n', mean(group1));
fprintf('Group 2 Mean = %.2f\n', mean(group2));
fprintf('P-value = %.4f\n', pValue);
if h == 1
    disp('There is a significant difference between the two groups.');
else
    disp('There is no significant difference between the two groups.');
end

% Graph 1: Attendance versus examination marks
figure;
scatter(attendance, examMarks, 60, 'filled');
hold on;
x = linspace(min(attendance), max(attendance), 100);
y = polyval(regressionCoefficients, x);
plot(x, y, 'LineWidth', 2);
xlabel('Attendance (%)');
ylabel('Examination Marks');
title('Attendance vs Examination Marks');
legend('Student Data', 'Regression Line', 'Location', 'best');
grid on;

% Graph 2: Average marks by subject
averageMarks = mean(marks);
figure;
bar(averageMarks);
xlabel('Subjects');
ylabel('Average Marks');
title('Average Marks by Subject');
xticklabels({'Mathematics', 'Programming', 'DBMS'});
grid on;

% Graph 3: Group performance comparison
figure;
bar([mean(group1), mean(group2)]);
xlabel('Student Group');
ylabel('Average Examination Marks');
title('Comparison of Student Groups');
xticklabels({'Group 1', 'Group 2'});
grid on;
