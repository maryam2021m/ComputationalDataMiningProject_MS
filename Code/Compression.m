function [] = Compression(img)
[U, S, V] = newSvd(img);

% تعریف ارایه برای ذخیره عکس های فشرده شده 
images = cell(1, 4);

% تعریف درصدهای فشرده‌سازی
compression_ratios = [10, 20, 30, 50];
for i = 1:length(compression_ratios)
    % محاسبه تعداد مقادیر تکین جدید
    n = round(compression_ratios(i)/100*size(S,1));
    % بازسازی ماتریس با تعداد مقادیر تکین جدید
    A_new = U(:,1:n)*S(1:n,1:n)*V(:,1:n)';
    images{i}=A_new;
end

% رسم تصاویر فشرده شده جدید
figure;
subplot(2,2,1);imshow(images{1},[]); title('10%');
subplot(2,2,2);imshow(images{2},[]); title('20%');
subplot(2,2,3);imshow(images{3},[]); title('30%');
subplot(2,2,4);imshow(images{4},[]); title('50%');
end