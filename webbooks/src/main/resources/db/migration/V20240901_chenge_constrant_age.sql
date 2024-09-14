-- Удаляем старое ограничение
ALTER TABLE clients DROP CONSTRAINT clients_age_check;

-- Добавляем новое ограничение
ALTER TABLE clients ADD CONSTRAINT clients_age_check CHECK (age > 0 AND age <= 150);