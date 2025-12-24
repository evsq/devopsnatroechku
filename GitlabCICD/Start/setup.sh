#!/bin/bash

set -e

echo "🚀 Начинаем автоматическую установку GitLab CI/CD..."

# Создаем директории
mkdir -p {gitlab,gitlab-runner}/{config,data,logs}

# Запускаем сервисы
echo "📦 Запускаем Docker Compose..."
docker-compose up -d

echo "⏳ Ожидаем запуск GitLab (это может занять 3-5 минут)..."
while ! curl -s http://gitlab.devopsnatroechku/users/sign_in > /dev/null; do
    echo "Ждем инициализацию GitLab..."
    sleep 30
done

echo "✅ GitLab запущен!"


echo "📝 Настраиваем runner..."

# Получаем registration token для runner
REGISTRATION_TOKEN=$(docker exec gitlab gitlab-rails runner "puts Gitlab::CurrentSettings.current_application_settings.runners_registration_token")

echo "Registration Token: $REGISTRATION_TOKEN"

echo "🐳 Регистрируем GitLab Runner..."

docker exec gitlab-runner gitlab-runner register \
    --non-interactive \
    --url "http://gitlab.devopsnatroechku" \
    --docker-extra-hosts "gitlab.devopsnatroechku:host-gateway" \
    --registration-token "$REGISTRATION_TOKEN" \
    --executor "docker" \
    --docker-image "docker:24" \
    --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" \
    --description "Docker Runner" \
    --tag-list "docker" \
    --run-untagged="true"

echo "🎉 Установка завершена!"
echo ""
echo "📊 Доступ к сервисам:"
echo "   GitLab: http://gitlab.devopsnatroechku"
echo "   Логин: root"
echo "   Пароль: Password123!"
echo ""
echo "🐳 Runner зарегистрирован и готов к работе!"