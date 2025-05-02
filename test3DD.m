clc;
clear;

% Specify the path to your OBJ file
obj = 'nta.obj'; % Replace with the path to your OBJ file

% Read the OBJ file using the custom function
obj3D = readObj(obj);

% Extraire les sommets et les faces
vertices = obj3D.v; % Sommets (Vertices)
if isstruct(obj3D.f)
    faces = obj3D.f.v; % Si les faces sont un struct, extraire les données
else
    faces = obj3D.f; % Si les faces sont déjà une matrice
end

% Vérification des dimensions
disp(['Nombre de sommets: ', num2str(size(vertices, 1))]);
disp(['Nombre de faces: ', num2str(size(faces, 1))]);

% --------------------------------------------
% 2. Affichage de l'objet 3D original
% --------------------------------------------
figure;
subplot(1, 2, 1);
patch('Vertices', vertices, 'Faces', faces, 'FaceColor', 'none', 'EdgeColor', 'k', 'LineWidth', 0.5);
grid on;
title('Objet 3D Original');
xlabel('X');
ylabel('Y');
zlabel('Z');
axis equal;
rotate3d on; % Activer la rotation pour l'interaction

% --------------------------------------------
% 3. Définir les matrices intrinsèque et extrinsèque
% --------------------------------------------
% Matrice intrinsèque (paramètres de la caméra)
fl = 1; % Longueur focale
K = [fl 0 0;  % fx
     0 fl 0;  % fy
     0 0 1];           % Homogène

% Matrice extrinsèque (position et orientation de la caméra)
theta = -pi/4; % Rotation de -45° autour de l'axe Y
R = [cos(theta) 0 sin(theta); 
     0          1 0; 
    -sin(theta) 0 cos(theta)];

T = [10; 0; 10]; % Translation : caméra décalée à droite et légèrement en avant
P = K * [R T]; % Matrice de projection totale

% --------------------------------------------
% 4. Projection des sommets en 2D
% --------------------------------------------
hmgn3D = [vertices, ones(size(vertices, 1), 1)]';
pnt2D = P * hmgn3D;

% Vérification des valeurs projetées
disp('Valeurs projetées (avant normalisation):');
disp(pnt2D(:, 1:5)); % Afficher les 5 premiers points projetés

% Normalisation des points projetés
pnt2D = pnt2D ./ pnt2D(3, :);

% Vérification des valeurs normalisées
disp('Valeurs projetées (après normalisation):');
disp(pnt2D(:, 1:5)); % Afficher les 5 premiers points normalisés

% --------------------------------------------
% 5. Affichage de l'objet projeté en 2D
% --------------------------------------------
subplot(1, 2, 2);
hold on;

for i = 1:size(faces, 1)
    % Vérification des sommets de chaque face
    faceIndices = faces(i, :);
    if any(faceIndices > size(pnt2D, 2))
        disp('Face avec indices invalides, ignorée.');
        continue; % Ignorer les faces avec indices invalides
    end
    faceVertices = pnt2D(:, faceIndices); % Sommets de chaque face
    patch(faceVertices(1, :), faceVertices(2, :), [0.8 0.8 1], 'EdgeColor', 'k'); % Utiliser patch pour afficher les faces
end

grid on;
title('Projection 2D de l\objet');
xlabel('X');
ylabel('Y');
axis equal;
